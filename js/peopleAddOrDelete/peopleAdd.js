function added(){
    var xhr = new XMLHttpRequest();
    xhr.open("POST", addContactF+atherUserId + addContactS, true);
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            console.log(json);
        }
    };
    var data = JSON.stringify();
    xhr.send(data);
}

function login(){
    var xhr = new XMLHttpRequest();
    var url = "url";
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            console.log(json.email + ", " + json.password);
        }
    };
    var data = JSON.stringify({"email": "hey@mail.com", "password": "101010"});
    xhr.send(data);
}



function addUserToMyContactList() {
    added();
    login();

}
