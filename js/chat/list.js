function setListState(){
    SocketManager.listChat('list', {
        offset:0,
        limit: 999999
    })
}
