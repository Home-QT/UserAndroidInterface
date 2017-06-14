function writeInChat() {
     if (massageArea.text !== "Введите сообщение"){
    SocketManager.writeChat('write', {
                                dialogId:dialogIdUser,
                                message:userMessageText
                            }, function(err, res){

          })
     }
}
