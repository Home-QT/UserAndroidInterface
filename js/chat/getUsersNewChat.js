function getUsers() {
    var timeIterationAdd = 0,lastMessageAdd=0,errUsers = []
    errUsers[0] = atherUserId
    ///этот участок перепишу в последствии того что надо будет
    SocketManager.writeCommon('getUsers', {users:errUsers},function(err,usersReQ){
        usersReQ.users.forEach(function(users){
            if (users.isOnline === true){
                statusOnline.color = "#14850C"
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
}
