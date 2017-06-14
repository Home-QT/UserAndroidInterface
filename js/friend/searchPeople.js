function searchUser() {
    var boolProperty
    SocketManager.writeCommon('searchPeople',{query:searchUserInFriend},function(err, res){
        var someText ,firstChar,idUserFined;
        if(searchTextContact.text.length > 2){
            for(var i = 0; i < res.people.length;i++){
                if(res.people[i].imgId !== ''){
                     someText = res.people[i].firstname + " " + res.people[i].lastname
                      firstChar = someText.substr(0, 1).toUpperCase();
                    //idUserFined = res.people[i].id
                if (res.people[i].isOnline === true)
                    boolProperty  = "true"
                    else
                        boolProperty = ''
                    peopleModel.append({onlineUserSearch:boolProperty,idFined:res.people[i].id,nicName: res.people[i].firstname + " " + res.people[i].lastname,textPhone: res.people[i].mainPhoneNumber,scorePeopleAva:imgUrlF+res.people[i].imgId+imgUrlS,searchBukva:firstChar,rectcolorit:'true'})
                }else{
                    if (res.people[i].isOnline === true)
                    boolProperty  = "true"
                    else
                        boolProperty = ''
                    peopleModel.append({onlineUserSearch:boolProperty,idFined:res.people[i].id,nicName:res.people[i].firstname + " " + res.people[i].lastname,textPhone: res.people[i].mainPhoneNumber,scorePeopleAva:"",searchBukva:firstChar,rectcolorit:""})
                }
            }
        }
    })
}
