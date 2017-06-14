function getPeopleJSON() {
    var request = new XMLHttpRequest()
    request.open('GET', profilUrl+myId, true);
    request.onreadystatechange = function() {
        if (request.readyState === XMLHttpRequest.DONE) {
            if (request.status && request.status === 200) {
                var result = JSON.parse(request.responseText)

                }
            } else {
                console.log("HTTP:", request.status, request.statusText)
            }
        }

    request.send()
}

function updateContractsList(){
    contractsListModel.clear();
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
        } else if (doc.readyState == XMLHttpRequest.DONE) {
            var parsedResponse = []
            parsedResponse = JSON.parse(doc.responseText)
            parsedResponse.data.forEach(function(contract){
                contractsListModel.append({
                    contractId: contract._id,
                    contracStatus: contract.status,
                    variants: contract.allowed.map(function(allowedAction){
                        return {
                            contractId: contract._id,
                            actionName: allowedAction.name,
                            title: allowedAction.title,
                        }
                    }),
                      userName:contract.firstname + " " + contract.lastname
                });
            });
        }
    }

    doc.open("POST", urlHistoryTransaction + "58bca1ac582c7f10466a367e71e824bca3b20e33866c49bd71ad55b0f6e50e8b");
    doc.send();
}

function pushAction(contractId, actionName){
}
