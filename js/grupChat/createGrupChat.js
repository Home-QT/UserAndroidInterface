function createNewChatGRUP() {
    SocketManager.writeChat('createChat', {
                                message:userMessageText ,
                                members:listPeopleAddToChat,
                                name:nameDialogToCreate
                            }, function(err, res){
                                if(res){
                                    dialogIdUser = res.dialog.id
                                }

                            })
}

