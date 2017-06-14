function dialogSearch() {
    p1modelDialog.clear()
    SocketManager.searchCommon('findInMessages',{keyword:searchUserInFriend},function(err, res){
        res.result.forEach(function(resResult){
        var now = new Date();
        var getData = new Date(resResult.time);
        var dataNow = now.getFullYear()+" "+now.getDay()+" "+now.getMonth();
        var dataGetTime = getData.getFullYear()+" "+getData.getDay()+" "+getData.getMonth()
        var printData
        if (dataNow === dataGetTime){
            printData = getData.getHours()+":"+getData.getMinutes()
        }else{
            printData =getData.getDay()+"."+getData.getMonth()+"."+ getData.getFullYear()
        }
        if(resResult.author !== myId)
            p1modelDialog.append({
                                     sUO:'',
                                     onlineUser:'',
                                     idUserDialog: resResult.dialog_id,
                                     idFinedUser: resResult.author,
                                     textBody:resResult.body,
                                     scoreDialogAva:'',
                                     dialogBukva:'',
                                     nicNameDialog:'',
                                     rectcolorit:'',
                                     type:resResult.type,
                                     timeOfTheLastMessage:printData,
                                     bigNotReadBull:'',
                                     shortNotReadBull:''
                                 })
        var userSearch = [resResult.author]
        resResult.listElement = p1modelDialog.get(p1modelDialog.count - 1)

        SocketManager.writeCommon('getUsers', {users:userSearch},function(err, userDataList){
             var firstChar = userDataList.users[0].firstname.substr(0, 1).toUpperCase();
            resResult.listElement.nicNameDialog = userDataList.users[0].firstname +  userDataList.users[0].lastname
             resResult.listElement.dialogBukva =  firstChar
            if (userDataList.users[0].imgId!==""){
                resResult.listElement.scoreDialogAva = imgUrlF+userDataList.users[0].imgId+imgUrlS
                resResult.listElement.rectcolorit = "true"
            }
            else{
                 resResult.listElement.scoreDialogAva  ="qrc:/image/title/tratata.png"
                 resResult.listElement.rectcolorit = ""
            }
            if (userDataList.users[0].isOnline === true)
                resResult.listElement.onlineUser = "true"
            else
                resResult.listElement.onlineUser = ""
             })
        })
    })
}
