function gurupInfo() {
    var itsMe = myId
    SocketManager.writeChat('get', {dialogId:dialogIdUser},function(err,aboutDialog){
        peopleModel.clear()
        SocketManager.writeCommon('getUsers', {users: aboutDialog.dialog.members},function(err,contactGupList){
            contactGupList.users.map(function(resUser){
                var someText,firstChar
                someText =   resUser.firstname + " " + resUser.lastname
                firstChar = someText.substr(0, 1).toUpperCase();
                var imageProfile
                if (resUser.imgId !== "")
                    imageProfile =  imgUrlF+resUser.imgId+imgUrlS
                else if (resUser.imgUrl !=="")
                    imageProfile = resUser.imgUrl
                else imageProfile = "qrc:/image/title/tratata.png"

                peopleModel.append({
                                       onlineUserSearch:resUser.isOnline ? 'Yes':"",
                                                                           finedUserId:resUser.id,
                                                                           nicName: resUser.firstname + " " + resUser.lastname,
                                                                           textPhone: resUser.mainPhoneNumber,
                                                                           scorePeopleAva:imageProfile,
                                                                           searchBukva:firstChar,
                                                                           rectcolorit:'true'})
            })
        })
    })
}
