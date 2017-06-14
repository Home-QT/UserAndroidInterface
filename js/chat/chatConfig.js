function getMessage(messagesChat){
    SocketManager.writingAtherChat('read', {dialogId:dialogIdUser}, function(err, res){
    })
    if(messagesChat.body){
    var massageBody = messagesChat.body
    var itsMassageshur , parserMessage, functionName
    if(massageBody){
    parserMessage = massageBody.replace(/\[\[=/,'')
    parserMessage = parserMessage.replace(/\=]\]/,'')
    var textBodyRemoved ='',textOfThePeopleDo = '', idAddedUser = '',userNameWhoAdd = '', bulletinOrNo = ''
    var charOfTheBody = parserMessage.split('')
    var metodRelevantnost = ['renamedTo','memberRemoved','memberAdded','bulletin',"http"]
    var metodLogo = ['изменил название беседы на ','покинул безеду','добавил в беседу','Товар','Ссылка']
    var offerAutorAvtar = "",offerImageBulletin = "",offerImageBulletin1 = "",offerImageBulletin2 = "",offerTitleBulletin = "",shortTextofBulletin = ""
    for (var i = 0; i < 13;i++){
        textBodyRemoved = textBodyRemoved + charOfTheBody[i]
        for(var j = 0; j <metodRelevantnost.length ; j++){
            if (textBodyRemoved === metodRelevantnost[j]){
                if (j === 0  || j === 2 || j === 3){
                    for (var numberAddedUser = i+2; numberAddedUser < charOfTheBody.length; numberAddedUser++){
                        idAddedUser =idAddedUser +  charOfTheBody[numberAddedUser]
                    }
                }

                if (j === 3){
                    bulletinOrNo = "true"
                    var request = new XMLHttpRequest()
                    request.open('GET', offerUrlGet+idAddedUser, true);
                    request.onreadystatechange = function() {
                        if (request.readyState === XMLHttpRequest.DONE) {
                            if (request.status && request.status === 200) {
                                var result = JSON.parse(request.responseText)
                                offerImageBulletin = offerImgIdF + String(result.offer.images[1].imageId) +offerImgIdS
                                offerImageBulletin1 = offerImgIdF + String(result.offer.images[0].imageId) +offerImgIdS
                                offerImageBulletin2 = offerImgIdF + String(result.offer.images[2].imageId) +offerImgIdS
                                offerTitleBulletin = result.offer.title
                            } else {
                                console.log("HTTP:", request.status, request.statusText)
                            }
                        }
                    }
                    request.send(0)
                }
                itsMassageshur = ""
                textOfThePeopleDo = metodLogo[j]
                i = 6666
                break;
            }else{
                itsMassageshur = "true"
            }
        }
    }
    }


    if  (idAddedUser.length === 24)
        idAddedUser = ""
    var retuntUser = ""


    p1model.append({
                       itsMessage: itsMassageshur ? "":"false",
                       itsMeSend:itsMassageshur ? ((messagesChat.author === myId) ? 'true':''):"",
                       elseTextScore:itsMassageshur ? ((messagesChat.author === myId) ? '':massageBody) : '',
                       myTextScore:itsMassageshur ? ((messagesChat.author === myId) ? massageBody : ''):"",
                       itsTime:itsMassageshur ? "" : textOfThePeopleDo +" " + idAddedUser,
                       textTime:itsMassageshur ? "" : "false",
                       counter: "",
                       imagePeopleAtherAvatar:itsMassageshur ? ((messagesChat.author === myId) ? '':"") : '',
                       UserName:itsMassageshur ?'':"",
                       itsBulletin:bulletinOrNo,
                       bulletinAvatar:bulletinOrNo ?"":"http://hobby-games.com.ua/shop/published/publicdata/HOBBYGAME8636/attachments/SC/products_pictures/zybin-nm-1-amodel_enl.jpg",
                       titleLogoBulletin:bulletinOrNo?"":"MN 3",
                       imgBulletin:bulletinOrNo?"":"http://stat.ameba.jp/user_images/20140608/21/hitop0628/da/4c/j/t02200165_0800060012967111090.jpg",
                       imgBulletin1:bulletinOrNo ?"":"http://stat.ameba.jp/user_images/20140608/21/hitop0628/59/1e/j/t02200165_0800060012967111089.jpg",
                       imgBulletin2:bulletinOrNo ?"":"http://stat.ameba.jp/user_images/20140608/21/hitop0628/20/00/j/t02200165_0800060012967111088.jpg",
                       shortTextBulletin:bulletinOrNo ?"":'Самолетик MN 3'
                   })
    }
    p1model.get(0).counter = "true"
    messagesChat.listElement = p1model.get(p1model.count - 1)
    if (messagesChat.author !== remamberUserGrupChat)
        retuntUser = "true"
    else
        retuntUser = ""
    messagesChat.listElement.counter =  retuntUser

    remamberUserGrupChat = messagesChat.author
    SocketManager.writeCommon('getUsers', {users:[messagesChat.author]},function(err,usersReQ){
        usersReQ.users.forEach(function(dataUserData){
            if (dataUserData.imgUrl !=='')
                messagesChat.listElement.imagePeopleAtherAvatar = dataUserData.imgUrl
            else if (dataUserData.imgId !== "")
                messagesChat.listElement.imagePeopleAtherAvatar =  imgUrlF +  dataUserData.imgId +imgUrlS
            else  messagesChat.listElement.imagePeopleAtherAvatar = 'qrc:/image/title/tratata.png'
            messagesChat.listElement.UserName = dataUserData.firstname + " " + dataUserData.lastname

        })
    })
}

function resMessage(messagesChat){
    var mess
    mess = p1model.get(1)
    console.log("mess.listElementmess.listElementmess.listElement",p1model.count)
    if(messagesChat.body){
    var massageBody = messagesChat.body
    var itsMassageshur , parserMessage, functionName
    if(massageBody){
    parserMessage = massageBody.replace(/\[\[=/,'')
    parserMessage = parserMessage.replace(/\=]\]/,'')
    var textBodyRemoved ='',textOfThePeopleDo = '', idAddedUser = '',userNameWhoAdd = '', bulletinOrNo = ''
    var charOfTheBody = parserMessage.split('')
    var metodRelevantnost = ['renamedTo','memberRemoved','memberAdded','bulletin',"http"]
    var metodLogo = ['изменил название беседы на ','покинул безеду','добавил в беседу','Товар','Ссылка']
    var offerAutorAvtar = "",offerImageBulletin = "",offerImageBulletin1 = "",offerImageBulletin2 = "",offerTitleBulletin = "",shortTextofBulletin = ""
    for (var i = 0; i < 13;i++){
        textBodyRemoved = textBodyRemoved + charOfTheBody[i]
        for(var j = 0; j <metodRelevantnost.length ; j++){
            if (textBodyRemoved === metodRelevantnost[j]){
                if (j === 0  || j === 2 || j === 3){
                    for (var numberAddedUser = i+2; numberAddedUser < charOfTheBody.length; numberAddedUser++){
                        idAddedUser =idAddedUser +  charOfTheBody[numberAddedUser]
                        /*SocketManager.writeCommon('getUsers', {users:[idAddedUser]},function(err,usersReQ){
                                                                userNameWhoAdd = usersReQ.users[usersReQ.users.length].username
                                                            })*/
                    }
                }

                if (j === 3){
                    bulletinOrNo = "true"
                    var request = new XMLHttpRequest()
                    request.open('GET', offerUrlGet+idAddedUser, true);
                    request.onreadystatechange = function() {
                        if (request.readyState === XMLHttpRequest.DONE) {
                            if (request.status && request.status === 200) {
                                var result = JSON.parse(request.responseText)
                                offerImageBulletin = offerImgIdF + String(result.offer.images[1].imageId) +offerImgIdS
                                offerImageBulletin1 = offerImgIdF + String(result.offer.images[0].imageId) +offerImgIdS
                                offerImageBulletin2 = offerImgIdF + String(result.offer.images[2].imageId) +offerImgIdS
                                offerTitleBulletin = result.offer.title
                            } else {
                                console.log("HTTP:", request.status, request.statusText)
                            }
                        }
                    }
                    request.send(0)
                }
                itsMassageshur = ""
                textOfThePeopleDo = metodLogo[j]
                i = 6666
                break;
            }else{
                itsMassageshur = "true"
            }
        }
    }
    }


    if  (idAddedUser.length === 24)
        idAddedUser = ""
    var retuntUser = ""

    p1model.insert(0,{
                       itsMessage: itsMassageshur ? "":"false",
                       itsMeSend:itsMassageshur ? ((messagesChat.author === myId) ? 'true':''):"",
                       elseTextScore:itsMassageshur ? ((messagesChat.author === myId) ? '':massageBody) : '',
                       myTextScore:itsMassageshur ? ((messagesChat.author === myId) ? massageBody : ''):"",
                       itsTime:itsMassageshur ? "" : textOfThePeopleDo +" " + idAddedUser,
                       textTime:itsMassageshur ? "" : "false",
                       counter:"true",
                       imagePeopleAtherAvatar:itsMassageshur ? ((messagesChat.author === myId) ? '':"") : '',
                       UserName:itsMassageshur ?'':"",
                       itsBulletin:bulletinOrNo,
                       bulletinAvatar:bulletinOrNo ?"":"http://hobby-games.com.ua/shop/published/publicdata/HOBBYGAME8636/attachments/SC/products_pictures/zybin-nm-1-amodel_enl.jpg",
                       titleLogoBulletin:bulletinOrNo?"":"MN 3",
                       imgBulletin:bulletinOrNo?"":"http://stat.ameba.jp/user_images/20140608/21/hitop0628/da/4c/j/t02200165_0800060012967111090.jpg",
                       imgBulletin1:bulletinOrNo ?"":"http://stat.ameba.jp/user_images/20140608/21/hitop0628/59/1e/j/t02200165_0800060012967111089.jpg",
                       imgBulletin2:bulletinOrNo ?"":"http://stat.ameba.jp/user_images/20140608/21/hitop0628/20/00/j/t02200165_0800060012967111088.jpg",
                       shortTextBulletin:bulletinOrNo ?"":'Самолетик MN 3'
                   })
    }
    var mess
    mess = p1model.get(1).counter = ""
    console.log("mess.listElementmess.listElementmess.listElement",p1model.count)



    messagesChat.listElement = p1model.get(p1model.count)
    if (messagesChat.author !== remamberUserGrupChat)
        retuntUser = "true"
    else
        retuntUser = ""
    messagesChat.listElement.counter =  retuntUser

    remamberUserGrupChat = messagesChat.author
    SocketManager.writeCommon('getUsers', {users:[messagesChat.author]},function(err,usersReQ){
        usersReQ.users.forEach(function(dataUserData){
            if (dataUserData.imgUrl !=='')
                messagesChat.listElement.imagePeopleAtherAvatar = dataUserData.imgUrl
            else if (dataUserData.imgId !== "")
                messagesChat.listElement.imagePeopleAtherAvatar =  imgUrlF +  dataUserData.imgId +imgUrlS
            else  messagesChat.listElement.imagePeopleAtherAvatar = 'qrc:/image/title/tratata.png'
            messagesChat.listElement.UserName = dataUserData.firstname + " " + dataUserData.lastname

        })
    })
}


function chatConfigCative() {
    var timeIterationAdd = 0,lastMessageAdd=0,errUsers = []
    errUsers[0] = atherUserId
    ///этот участок перепишу в последствии того что надо будет
    SocketManager.writeCommon('getUsers', {users:errUsers},function(err,usersReQ){
        usersReQ.users.forEach(function(users){
            if (users.isOnline === true){
                statusOnline.color = "#69A107"
                //textIsOnlineStatusUser = "Пользователь онлайн"
            }else{
                var timestamp = users.lastSeen
                var date = new Date(timestamp );
                var formattedDate = ('0' + date.getDate()).slice(-2) + '.' + ('0' + (date.getMonth() + 1)).slice(-2) + '.' + date.getFullYear() + ' ' + ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2);
                textIsOnlineStatusUser= formattedDate
                statusOnline.color  = "#a7a7a7"
                textIsOnlineStatusUser ="Пользователь был онлайн: " + formattedDate
            }

            var someText  =  users.firstname + " " + users.lastname
            var  firstChar = someText.substr(0, 1).toUpperCase();
            bukvaAlf.text = firstChar
            nameMyFriend.text = users.firstname + " " + users.lastname
            if (users.imgId !== ''){
                myAva.source = imgUrlF+users.imgId+imgUrlS
                background.z = 5
            }else{
                myAva.source = ""
                background.z = 0
            }
        })
    })

    SocketManager.writingAtherChat('getMessages', {dialogId:dialogIdUser, offset:addOffset, limit:addLimit}, function(err, messagesRes){
        var itsMe = myId

        messagesRes.messages.forEach(function(messagesChat){
            getMessage(messagesChat)
        })

        })
        cacheChatUserList.splice(0,cacheChatUserList.length)
}



function subscribeOnMessage(){
SocketManager.subscribe(SocketManager.Context.Chat, 'message', function(err, res){

p1input.text = res.body
    if (res.dialogId ===dialogIdUser )
    if(res){
        SocketManager.writingAtherChat('read', {dialogId:dialogIdUser}, function(err, res){

        })
       //p1model.clear()
        if (res.author === myId)
            musickPut.play()
        else{
            playDown.play()
           // notificationClient.notification = res.body
        }
        //notificationClient.notification = res.body
        resMessage(res)
        //massageArea.text = ""

    }
 })
    SocketManager.subscribe(SocketManager.Context.Chat,'read',function(err, res){
        SocketManager.writingAtherChat('read', {dialogId:dialogIdUser}, function(err, res){
        })
    })

    SocketManager.subscribe(SocketManager.Context.Chat,'hasRead',{userId:myId,dialogId:dialogIdUser},function(err, res){})

   SocketManager.subscribe(SocketManager.Context.Chat,'getUnreadDialogsList',function(err, res){})


    SocketManager.subscribe(SocketManager.Context.Chat,'writing',function(err, res){
        if (res.writing){
            if (res.userId != myId){

                wtriteMe.visible = true
                up.properties="y,y"
                //p1scores.y = - 55

            }
        } else{
            wtriteMe.visible = false
           // p1scores.y = -10
        }

    })
}
