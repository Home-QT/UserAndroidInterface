function getMessages (messagesChat){
    var itsMe = myId
        var massageBody = messagesChat.body
        var itsMassageshur , parserMessage, functionName
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
                           bulletinAvatar:"http://hobby-games.com.ua/shop/published/publicdata/HOBBYGAME8636/attachments/SC/products_pictures/zybin-nm-1-amodel_enl.jpg",
                           titleLogoBulletin:"MN 3",
                           imgBulletin:"http://stat.ameba.jp/user_images/20140608/21/hitop0628/da/4c/j/t02200165_0800060012967111090.jpg",
                           imgBulletin1:"http://stat.ameba.jp/user_images/20140608/21/hitop0628/59/1e/j/t02200165_0800060012967111089.jpg",
                           imgBulletin2:"http://stat.ameba.jp/user_images/20140608/21/hitop0628/20/00/j/t02200165_0800060012967111088.jpg",
                           shortTextBulletin:'Самолетик MN 3'
                       })

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

function grupChatStyle() {
    SocketManager.writingAtherChat('read', {dialogId:dialogIdUser}, function(err, res){

    })
    // Код Тет чата был автоматически сгенерированный QT моя криворукость здесь ни при чем этот код будет лучше =)   var timeIterationAdd = 0,lastMessageAdd=0,errUsers = []
    SocketManager.writeChat('get', {dialogId:dialogIdUser},function(err,aboutDialog){
        if (aboutDialog.dialog.name !== ""){
            nameMyFriend.text = aboutDialog.dialog.name
            nameOfDialog = aboutDialog.dialog.name
        }
        if (aboutDialog.dialog.members.length <5)
            button_enter_label.text = aboutDialog.dialog.members.length +" учасника"
        else
            button_enter_label.text = aboutDialog.dialog.members.length +" учасников"
    })


    SocketManager.writingAtherChat('getMessages', {dialogId:dialogIdUser,  offset:addOffset, limit:addLimit}, function(err, messagesRes){
        var itsMe = myId
        messagesRes.messages.forEach(function(messagesChat){
        getMessages(messagesChat);
            })
    })
}

function resInsertNew(messagesChat){

    var itsMe = myId
        var massageBody = messagesChat.body
        var itsMassageshur , parserMessage, functionName
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

        if  (idAddedUser.length === 24)
            idAddedUser = ""
        var retuntUser = ""
        var row = {
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
            bulletinAvatar:"http://hobby-games.com.ua/shop/published/publicdata/HOBBYGAME8636/attachments/SC/products_pictures/zybin-nm-1-amodel_enl.jpg",
            titleLogoBulletin:"MN 3",
            imgBulletin:"http://stat.ameba.jp/user_images/20140608/21/hitop0628/da/4c/j/t02200165_0800060012967111090.jpg",
            imgBulletin1:"http://stat.ameba.jp/user_images/20140608/21/hitop0628/59/1e/j/t02200165_0800060012967111089.jpg",
            imgBulletin2:"http://stat.ameba.jp/user_images/20140608/21/hitop0628/20/00/j/t02200165_0800060012967111088.jpg",
            shortTextBulletin:'Самолетик MN 3'
        }
        p1model.insert(0,row)

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

function subscribeOnMessage(){
    SocketManager.subscribe(SocketManager.Context.Chat, 'message', function(err, res){
        console.log("JSON.stringify(res)JSON.stringify(res)JSON.stringify(res)JSON.stringify(res)JSON.stringify(res)",JSON.stringify(res))
        /*bodyNotification = res.body*/
        p1input.text = res.body
        if (res.dialogId ===dialogIdUser )
        if(res){
            SocketManager.writingAtherChat('read', {dialogId:dialogIdUser}, function(err, res){

            })

            p1input.text.clear()
            if (res.author === myId)
                musickPut.play()
                else
            playDown.play()
            resInsertNew(res)
             massageArea.text = ""
            //playSound.play()

        }
    })



    SocketManager.subscribe(SocketManager.Context.Chat,'hasRead',{userId:myId,dialogId:dialogIdUser},function(err, res){})

    SocketManager.subscribe(SocketManager.Context.Chat,'getUnreadDialogsList',function(err, res){})


    SocketManager.subscribe(SocketManager.Context.Chat,'writing',function(err, res){
        if (res.writing){
            if (res.userId != myId){
                wtriteMe.visible = true
                up.properties="y,y"
                //p1scores.y = - 5
                //notificationClient.notification = res.body
            }
        } else{
            wtriteMe.visible = false
            //p1scores.y = -10
        }

    })
}
