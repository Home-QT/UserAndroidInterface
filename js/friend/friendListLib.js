function friendListLib() {
    SocketManager.lastChat('list', { offset:0,limit: 99999 }, function(err, resList){
        resList.dialog.forEach(function(listDialog, mam){
            listDialog.members.forEach(function(prev, cur){
                if(prev !== myId){
                    massPeople[massPeople.length] = prev
                }
            })
        })
    })
}
