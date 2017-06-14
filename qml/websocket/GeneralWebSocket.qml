import QtQuick 2.0
import QtWebSockets 1.0
import 'qrc:/js/socketManager.js' as SocketManager
import 'qrc:/js/friend/friendLib.js' as FriendLib
import 'qrc:/js/chat/ChatConfig.js' as ChatConfigLib
import 'qrc:/js/friend/searchPeople.js' as SearchUserGup
import 'qrc:/js/chat/CreateChatTet.js' as CreateChatConfig
import 'qrc:/js/contactList/contactList.js' as CreateContactList
import 'qrc:/js/friend/friendListLib.js' as FriendListLib
import 'qrc:/js/grupChat/chatStyle.js' as GrupChatStyle
import 'qrc:/js/map/mapGeoPost.js' as GeneralMapGeoLocation
import 'qrc:/js/write/writeOnChat.js' as WriteInChat
import 'qrc:/js/grupChat/selectedPeople.js' as GetSelectedPeople
import 'qrc:/js/grupChat/createGrupChat.js' as CreateGrupChat
import 'qrc:/js/grupChat/bildNewGupStyle.js' as BildTopInterface
import 'qrc:/js/friend/searchWordDialog.js' as DialogSearchTab
import 'qrc:/js/chat/getUsersNewChat.js' as GetUsrtToCreateTetChat
import 'qrc:/js/grupChat/grupInfo.js' as InfoGupGrup

Item {
    Rectangle{
        Component.onCompleted: {
            if (exitMode === 0){
                tokenProperty = tokenUSL
                socket.active = !socket.active
                SocketManager.applySocket(socket)
            }else{
                tokenProperty = ''
            }
        }
    }
    property string tokenProperty: tokenUSL

    WebSocket {
        id: socket
        url: webSocketUrl
        onTextMessageReceived: {
            try {
                SocketManager.receiveMessage(message)
            }
            catch(err){
                throw err
            }
        }
        onStatusChanged:
            if (socket.status == WebSocket.Error) {
                console.log("Error: " + socket.errorString)
            } else if (socket.status == WebSocket.Open) {
                try {
                    SocketManager.writeCommon('auth', {token: tokenProperty}, function(err, res){
                        if (err) return console.error('Epic fail')
                        if (res){
                            if (loaderMyid === 0 ){
                                myImgId = res.user.imgId
                                myId = res.user.id
                                myUserName = res.user.firstname + " " + res.user.lastname
                                if (res.user.isAuthorized ===  true ){
                                    socketStatusActive = socket.status
                                }
                                console.log(JSON.stringify(res))
                            }else{
                                loaderMyid++
                            }
                            switch(urlBilderForWebSocket){
                            case "qrc:/qml/friend/Friend.qml":
                                switch(searchActive){
                                case "People":
                                    SearchUserGup.searchUser()
                                    break;
                                case "Dialog":
                                    DialogSearchTab.dialogSearch()
                                    break;
                                default:
                                    switch(indexCheckedInTabBar){
                                    case 0:
                                        FriendLib.friend()
                                        break;
                                    case 1:
                                        CreateContactList.getContactList()
                                        break;
                                    default:
                                        console.log("Can't see urlBilderForWebSocket:",urlBilderForWebSocket ,indexCheckedInTabBar )
                                        break;
                                    }
                                }
                                break;
                            case "qrc:/qml/chat/Chat.qml":
                                switch(createTetChat){
                                case "Yes":
                                    GetUsrtToCreateTetChat.getUsers()
                                    break;
                                case "CreateTet":
                                    CreateChatConfig.createTetFunction()
                                    ChatConfigLib.subscribeOnMessage()
                                    createTetChat = ""
                                    break;
                                default:
                                switch(firstClick){
                                case "true":
                                ChatConfigLib.subscribeOnMessage()
                                ChatConfigLib.chatConfigCative()
                                    break;
                                case "false":
                                    ChatConfigLib.subscribeOnMessage()
                                    WriteInChat.writeInChat()
                                     break;
                                }
                                break;
                                }
                                break;
                            case "qrc:/qml/grup/grupChatStile.qml":
                                switch(switchOptionalRightMenue){
                                case 1:{
                                    if (textNameDialog.text !== "Название чата")
                                        SocketManager.rename('rename',{dialogId:dialogIdUser,name:textNameDialog.text},function(err,res){
                                        })
                                    switchOptionalRightMenue = 0
                                    break;
                                }
                                case 2:{
                                    SocketManager.addMember('leave',{dialogId:dialogIdUser},function(err,res){
                                    })
                                    switchOptionalRightMenue = 0
                                    break;
                                }
                                case 3:

                                    break;
                                }
                                switch(firstClick){
                                case "true":
                                    ChatConfigLib.subscribeOnMessage()
                                    GrupChatStyle.grupChatStyle()
                                    break;
                                case "false":
                                    ChatConfigLib.subscribeOnMessage()
                                    WriteInChat.writeInChat()
                                     break;
                                }
                                break;
                            case "qrc:/qml/grup/CreateGrupChat.qml":
                                CreateContactList.getContactList()
                                break;
                            case "qrc:/qml/grup/selectedPeople.qml":
                                GetSelectedPeople.getSelectedPeople()
                                break;
                            case "qrc:/qml/grup/gupChatToCreate.qml":
                                console.log(itsNewChat)
                                switch(itsNewChat){
                                case "":
                                    BildTopInterface.topInterface()
                                    break;
                                case "Yes":
                                    CreateGrupChat.createNewChatGRUP()
                                    ChatConfigLib.subscribeOnMessage()
                                    itsNewChat = "No"
                                    break;
                                case "No":
                                    ChatConfigLib.subscribeOnMessage()
                                    WriteInChat.writeInChat()
                                    break;
                                default:
                                    console.log("It's not new chat")
                                    break;
                                }
                                break;
                            case "qrc:/qml/grup/grupInfo.qml":
                                InfoGupGrup.gurupInfo()
                                break;
                            default:
                                console.log("Fail in loader!!!:",urlBilderForWebSocket)
                                break;
                            }
                            /* if (createNewTetChatPeople === 1){
                                CreateChatConfig.createTetFunction()
                                createNewTetChatPeople++
                            }

                            if (friendUrl === 'qrc:/qml/friend/Friend.qml'){
                                FriendLib.friend()
                                SearchUserGup.searchUser()
                                CreateContactList.getContactList()
                            }
                            if (swipeByChatConfig === 'qrc:/qml/chat/Chat.qml'){

                                    if (criateDialog === "No"){
                                        ChatConfigLib.subscribeOnMessage()


                                        if(seqr ===0){
                                            ChatConfigLib.chatConfigCative()

                                        }
                                        if (whenISend == 1){
                                            writeAnimationRectangle = 0
                                            p1model.append({itsMessage: "",itsMeSend:'true',elseTextScore:'',myTextScore:userMessageText,
                                                               itsTime:"" , textTime:'', counter:''
                                                           })
                                            try{

                                                SocketManager.writeChat('write', {
                                                                            dialogId:dialogIdUser,
                                                                            message:userMessageText
                                                                        }, function(err, res){
                                                                            p1input.text = res.body
                                                                        })
                                                whenISend = 0
                                            }
                                            catch(err){
                                                throw err
                                            }
                                        }
                                    }
                                }
                        }
                        if (swipeByChatConfig === 'qrc:/qml/grup/grupChatStile.qml'){
                            GrupChatStyle.subscribeOnMessage()
                           *//* switch(switchOptionalRightMenue){
                            case 1:{
                                if (textNameDialog.text !== "Название чата")
                                SocketManager.rename('rename',{dialogId:dialogIdUser,name:textNameDialog.text},function(err,res){
                                })
                                switchOptionalRightMenue = 0
                                break;
                            }
                            case 2:{
                                SocketManager.addMember('leave',{dialogId:dialogIdUser},function(err,res){
                                })
                                switchOptionalRightMenue = 0
                               break;
                            }
                            case 3:

                                break;
                            }*//*
                            GrupChatStyle.grupChatStyle()
                            if (whenISend == 1){
                                writeAnimationRectangle = 0
                                p1model.append({itsMessage: "",itsMeSend:'true',elseTextScore:'',myTextScore:userMessageText,
                                                   itsTime:"" , textTime:'', counter:''
                                               })
                                try{

                                    SocketManager.writeChat('write', {
                                                                dialogId:dialogIdUser,
                                                                message:userMessageText
                                                            }, function(err, res){
                                                                p1input.text = res.body

                                                            })


                                    whenISend = 0

                                }
                                catch(err){
                                    throw err
                                }
                        }
                    }

                            if (criateDialog === "Yes"){
                                try{
                                    SocketManager.writeChat('createTet', {
                                                                message:userMessageText,
                                                                receiver:atherUserId
                                                            }, function(err, res){
                                                                if(res){
                                                                    dialogIdUser = res.dialog.id
                                                                    SubscribeOnChatDialog.subscribeOnChat(searchUserInFriend)
                                                                    seqr = 0
                                                                    ChatConfigLib.chatConfigCative()
                                                                }

                                                            })
                                    criateDialog = "No"
                                }catch(err){
                                    throw err
                                }
                            }
                            if (criateGrupDialog == "Yes"){
                                try{
                                    var messageToCreate = "РќСѓ РІРѕРѕР±С‰РµРј С‚Рѕ С‡Р°С‚ СЃРѕР·РґР°РЅ"
                                    SocketManager.writeChat('createChat', {
                                                                message:userMessageText ,
                                                                members:listPeopleAddToChat,
                                                                name:"GUP"
                                                            }, function(err, res){
                                                                if(res){
                                                                    dialogIdUser = res.dialog.id
                                                                }

                                                            })


                                    criateGrupDialog = "No"
                                }catch(err){
                                    throw err
                                }*/
                            }

                    })
                }
                catch(err){
                    throw err
                }

            } else if (socket.status == WebSocket.Closed){
                console.log(socket.status)
            }
    }
}
