function getContactList() { 

    peopleModel.clear()
    var request = new XMLHttpRequest()
    request.open('GET', profilUrl+myId, true);
    request.onreadystatechange = function() {
        if (request.readyState === XMLHttpRequest.DONE) {
            if (request.status && request.status === 200) {
                var result = JSON.parse(request.responseText)
                if (myProfil === "")
                myProfil =  JSON.parse(request.responseText)
                if (cacheContactList.length === 0)
                cacheContactList = result.profile.socialList
                var kontainerforaut = 0
               SocketManager.writeCommon('getUsers', {users: cacheContactList},function(err,contactGupList){
                    contactGupList.users.map(function(resUser){
                         var someText,firstChar
                         someText =  resUser.firstname + " " + resUser.lastname
                         firstChar = someText.substr(0, 1).toUpperCase();
                         peopleModel.append({
                                  onlineUserSearch:resUser.isOnline ? 'Yes':"",
                                  idFined:resUser.id,
                                  nicName: resUser.firstname + " " + resUser.lastname,
                                  textPhone: resUser.mainPhoneNumber,
                                  scorePeopleAva:imgUrlF+resUser.imgId+imgUrlS,
                                  searchBukva:firstChar,
                                  rectcolorit:'true'})
                        if (urlBilderForWebSocket !== "qrc:/qml/friend/Friend.qml")
                        if (peopleScores.count > 0 ){
                            cantCreate.visible = false
                            createGrupChatVisible = true
                        }
                        else{
                            cantCreate.visible = true
                            createGrupChatVisible = false
                        }
                        })
                    kontainerforaut++
                })
            } else {
                console.log("HTTP:", request.status, request.statusText)
            }
        }
    }
    request.send()
    rectContact.visible = false
}
