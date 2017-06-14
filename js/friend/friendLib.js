function friend(){
    var userData = []
    var massages = {}
    var lastMessegeTime = {}
    var onlineStatus = []
     SocketManager.updateStatusSubscription('updateStatusSubscription',{subscribe:Object.keys(userData),unsubscribe:[]},function(err, dataOnlineUsers){
         onlineStatus  =  dataOnlineUsers.isOnline
     })
    SocketManager.lastChat('list', { offset:0,limit: 99999 }, function(err, resList){
        resList.dialog.reverse()

        resList.last_message.forEach(function(lasssMessage){
            massages[lasssMessage.dialog_id.toString()] = lasssMessage.body
            lastMessegeTime[lasssMessage.dialog_id.toString()] = lasssMessage.time
        })
        resList.dialog.forEach(function(dialog, mam){
            var membersWithoutMe = []
            dialog.members.forEach(function(member){
                userData[member] = true
                if(member !== myId) membersWithoutMe.push(member)
            })
            var itsMassageshur, parserMessage, functionName
            if (massages[dialog.id]){
                parserMessage = massages[dialog.id].replace(/\[\[=/,'')
                parserMessage = parserMessage.replace(/\=]\]/,'')
                var textBodyRemoved ='',textOfThePeopleDo = '', idAddedUser = '',userNameWhoAdd = ''
                var charOfTheBody = parserMessage.split('')
                var metodRelevantnost = ['renamedTo','memberRemoved','memberAdded','bulletin',"http"]
                var metodLogo = ['изменил название беседы на ','покинул безеду','добавил в беседу','Товар','Ссылка']

                for (var i = 0; i < 29;i++){
                    textBodyRemoved = textBodyRemoved + charOfTheBody[i]
                    for(var j = 0; j <metodRelevantnost.length ; j++){
                        if (textBodyRemoved === metodRelevantnost[j]){
                            if (j === 0  || j === 1 ||j === 2 || j === 3 || j === 4){
                                massages[dialog.id] = ""
                                for (var numberAddedUser = i+2; numberAddedUser < charOfTheBody.length; numberAddedUser++){
                                    massages[dialog.id] = metodLogo[j]
                                }
                            }
                            itsMassageshur = ""
                            textOfThePeopleDo = metodLogo[j]
                            i = 6666
                            break;
                        }else{
                            itsMassageshur = "true"
                            //i = 6666
                            //break;
                        }
                    }
                }
            }
            var now = new Date();
            var getData = new Date(lastMessegeTime[dialog.id]);
            var dataNow = now.getFullYear()+" "+now.getDay()+" "+now.getMonth();
            var dataGetTime = getData.getFullYear()+" "+getData.getDay()+" "+getData.getMonth()
            var printData
               if (dataNow === dataGetTime){
                   printData = getData.getHours()+":"+getData.getMinutes()
               }else{
                  printData =getData.getDay()+"."+getData.getMonth()+"."+ getData.getFullYear()
               }

            p1modelDialog.append({
                sUO:'',
                onlineUser:'',
                idUserDialog: String(dialog.id),
                idFinedUser: membersWithoutMe[0],
                textBody: massages[dialog.id],
                scoreDialogAva:'',
                dialogBukva:'',
                nicNameDialog:'',
                rectcolorit:'',
                type:String(dialog.type),
                timeOfTheLastMessage:printData,
                bigNotReadBull:'',
                shortNotReadBull:''
            })

            dialog.listElement = p1modelDialog.get(p1modelDialog.count - 1)
        })
        var AwesmeUsersCache = {}
        SocketManager.writeCommon('getUsers', {users:Object.keys(userData)},function(err, userDataList){
            userDataList.users.forEach(function(user){
                user.someName = user.firstname + " " + user.lastname|| user.email
                if (user.imgId!==""){
                    user.avatarURL =imgUrlF+user.imgId+imgUrlS
                }
                else
                    user.avatarURL ="qrc:/image/title/tratata.png"
                if (user.isOnline === "true"){
                    user.isOnline = "true"
                }else{
                    user.isOnline =''
                }
                AwesmeUsersCache[user.id] = user
            })
            resList.dialog.forEach(function(dialog){
                if (!dialog.name){
                    dialog.name = dialog.members.filter(function(member){
                        return member !== myId
                    }).map(function(member){
                        if (AwesmeUsersCache[member].someName)
                        return AwesmeUsersCache[member].someName
                    }).join(', ')
                }

                var temporaryFuckedUser

                if (dialog.members[0]!== myId)
                 temporaryFuckedUser = AwesmeUsersCache[dialog.members[0]]
                else
                  temporaryFuckedUser = AwesmeUsersCache[dialog.members[1]]
                var firstChar = dialog.name.substr(0, 1).toUpperCase();

                if (temporaryFuckedUser.avatarURL === "qrc:/image/title/tratata.png")
                   dialog.listElement.rectcolorit = ""
                else
                   dialog.listElement.rectcolorit = "true"



                /*if (String(temporaryFuckedUser.isOnline) === "true"){
                   dialog.listElement.sUO =  "true"
                   dialog.listElement.onlineUser =  ""
                }else{
                   dialog.listElement.sUO =  ""
                    dialog.listElement.onlineUser =  "true"
                }*/
                if (dialog.name !== "")
                dialog.listElement.nicNameDialog = dialog.name
                dialog.listElement.dialogBukva = firstChar
                dialog.listElement.scoreDialogAva = temporaryFuckedUser.avatarURL

                resList.unread.map(function(resUnread){


                    if ( resUnread.dialog_id === dialog.id &&   resUnread.user_id !== myId && resUnread.how > 0){
                        console.log(resUnread.dialog_id, dialog.id,resUnread.user_id,myId,resUnread.how)
                        dialog.listElement.shortNotReadBull = "true"
                    }
                     if (  resUnread.dialog_id === dialog.id && resUnread.user_id === myId && resUnread.how > 0){
                         console.log(resUnread.dialog_id, dialog.id,resUnread.user_id,myId,resUnread.how)
                        dialog.listElement.bigNotReadBull = "true"
                         howINotRead =  Number(howINotRead) + Number(resUnread.how)
                    }
                    /*if (resUnread.dialog_id === dialog.id   && resUnread.user_id !== myId && resUnread.how >0){
                       dialog.listElement.bigNotReadBull = "true"
                    }else{
                       dialog.listElement.bigNotReadBull = ""
                        if (resUnread.dialog_id === dialog.id   && resUnread.user_id === myId && resUnread.how >0){
                            dialog.listElement.shortNotReadBull = ""
                        }
                    }*/

                })

            })
        })
    })
    rect.visible = false
}
