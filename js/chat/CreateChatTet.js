function createTetFunction() {
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
}
