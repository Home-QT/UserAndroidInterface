function getSelectedPeople() {
    SocketManager.writeCommon('getUsers', {users: listPeopleAddToChat},function(err,contactGupList){
         contactGupList.users.map(function(resUser){
              var someText,firstChar
              someText =  resUser.firstname + " " + resUser.lastname
              firstChar = someText.substr(0, 1).toUpperCase();
              peopleModel.append({
                       onlineUserSearch:resUser.isOnline ? 'Yes':"",
                       finedUserId:resUser.id,
                       nicName: resUser.firstname + " " + resUser.lastname,
                       textPhone: resUser.mainPhoneNumber,
                       scorePeopleAva:imgUrlF+resUser.imgId+imgUrlS,
                       searchBukva:firstChar,
                       rectcolorit:'true'})
            }
        )
    })
}
