import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0

Item {


    Image {
        id: image
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  0
        width: sizeWidthConfig *  481
        height: sizeHeigthConfig * 85
        z: 3
        source: "qrc:/image/title/blue.png"
        smooth: true
    }
    Rectangle{
        width: sizeWidthConfig * 120
        height: sizeHeigthConfig * 60
        y:sizeHeigthConfig * 50
        x:sizeWidthConfig * -40
        z:2
        rotation: 90
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 1.0; color: "#1976D2"}
            }
    }
    Rectangle{
        width: sizeWidthConfig * 120
        height: sizeHeigthConfig * 60
        y:sizeHeigthConfig * 50
        x:sizeWidthConfig * 400
        z:2
        rotation: -90
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 1.0; color: "#1976D2"}
            }
    }


    /*Image {
        z:20
        opacity: 0.5
        source: "qrc:/image/sizeConfig/Управление Объявлениями.png"
    }*/
    DropShadow {
        anchors.fill: image
        radius: 6.0
        opacity: 0.24
        z: 2
        color: "#000000"
        source: image
    }

    Rectangle{
        width: sizeWidthConfig * 480
        height: sizeHeigthConfig * 830
        color: "#212121"
        opacity: 0.14
    }
    Flickable{
        width: sizeWidthConfig * 480
        height: sizeHeigthConfig * 60
        contentWidth:sizeWidthConfig *  700
        y:sizeHeigthConfig * 84

    Row {
        id:buttonRow

        width: sizeWidthConfig *  175; height: sizeHeigthConfig * 60
        Repeater {
            id:repeaterView
            model:["АКТИВНЫЕ","НЕ АКТИВНЫЕ","НА МОДЕРАЦИИ","ОТКЛОНЕНО"]
            delegate: buttonViewDelegate
            }
        }

    }
    /*DropShadow {
        anchors.fill: buttonRow
        radius: 6.0
        opacity: 0.24
        color: "#000000"
        source: buttonRow
    }*/

    Component {
        id: buttonViewDelegate
            Rectangle {
                id:rectButton
                width: sizeWidthConfig * 175; height: sizeHeigthConfig * 60
                color: "#1976D2"
                Text{
                    id:textButton
                    y:sizeHeigthConfig * (rectButton.height - textButton.contentHeight)/2
                    x:sizeWidthConfig * (rectButton.width - textButton.contentWidth)/2
                    width: sizeWidthConfig * textButton.contentWidth
                    text: modelData
                    color: "white"
                    font.family: "Roboto";
                    font.pixelSize: sizeHeigthConfig * 20
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        switch(index){
                        case 0:
                             getMyOfferList("ACTIVE")
                            break;
                        case 1:
                             getMyOfferList("DEACTIVATED")
                            break;
                        case 2:
                            getMyOfferList("ON_MODERATION")
                            break;
                        case 3:
                              getMyOfferList("REJECTED")
                            break;
                        }
                    }
                }
             }


    }

    Component {
        id: bulletinDelegate
        Rectangle{
            width: sizeWidthConfig *  462; height: sizeHeigthConfig*520
            Rectangle{
                id:bulletinRect
                z:2
                 width: sizeWidthConfig *  462; height: sizeHeigthConfig*520
                Text {
                    id:titleText
                    x: sizeWidthConfig * 20
                    y: sizeHeigthConfig * 20
                    width: sizeWidthConfig * 370
                    height: sizeHeigthConfig * 35
                    clip: true
                    text: titleTextAdd
                    font.pixelSize: sizeHeigthConfig * 24
                    wrapMode: Text.WordWrap
                    font.family: "Roboto";
                }

                Image {
                    id:ice
                    y: sizeHeigthConfig * 25 + titleText.height
                    x: sizeWidthConfig * 22
                    source: "qrc:/image/mybylletin/ic_visibility_24px.svg"
                    sourceSize.width: sizeWidthConfig *  30
                    sourceSize.height: sizeHeigthConfig * 30
                    visible: false

                }
                ColorOverlay {
                    anchors.fill: ice
                    source: ice
                    color: "#95989A"
                }

                Text {
                    y: sizeHeigthConfig * 23 + titleText.height
                    x: sizeWidthConfig * 62
                    id: viewsBulletin
                    text: view
                    font.pixelSize:  sizeHeigthConfig * 20
                    font.family: "Roboto";
                    color: "#95989A"
                }

                Image {
                    id:phoneIce
                    y: sizeHeigthConfig * 25 + titleText.height
                    x: sizeWidthConfig * 400 - phoneLook.width-20
                    source: "qrc:/image/mybylletin/phone_ice.svg"
                    sourceSize.width: sizeWidthConfig * 20
                    sourceSize.height: sizeHeigthConfig * 20
                    visible: false
                }
                ColorOverlay {
                    anchors.fill: phoneIce
                    source: phoneIce
                    color: "#95989A"
                }

                Text {
                    y: sizeHeigthConfig * 23 + titleText.height
                    x: sizeWidthConfig * 400 - phoneLook.width
                    id: phoneLook
                    font.pixelSize: sizeHeigthConfig * 20
                    text:phoneView
                    color: "#95989A"
                    horizontalAlignment:Text.AlignRight
                }
                /*Text {
                    id: name
                    text: sourceImageId
                }*/
                SwipeView{
                    id:imageSwipe
                    clip: true
                    y:sizeHeigthConfig * 90
                    width: sizeWidthConfig *  462; height:sizeHeigthConfig * 270
                        Repeater {
                            id:repeaterView
                            model:repeaterViewModel
                            delegate: repeaterViewDelegate
                    }

                }
                Component {
                    id: repeaterViewDelegate
                    Item {
                        width: sizeWidthConfig *  462; height: sizeHeigthConfig * 270
                        /*Rectangle {
                            id: background
                            z:4
                            width: sizeWidthConfig *  462; height: sizeHeigthConfig * 270

                        }*/
                        Image {
                            id: avaSerchPeople
                            x: sizeWidthConfig * 0
                            y: sizeHeigthConfig * 5
                            z:4
                            visible:true
                            source: sourceImageId
                            fillMode: Image.Stretch
                            width: sizeWidthConfig *  462; height: sizeHeigthConfig * 270
                        }
                        ShaderEffectSource {
                            sourceItem:avaSerchPeople
                            recursive:true
                        }
                        /*OpacityMask {
                            id: roundedPhoto
                            z:5
                            clip:true
                            anchors.fill: background
                            source: avaSerchPeople
                            maskSource: background
                            //visible: (photoImage.status==Image.Ready)
                        }*/

                        /*Image {
                            width: sizeWidthConfig *  462; height: sizeHeigthConfig * 270
                            clip: true
                            source: sourceImageId
                        }*/
                    }
                }
                Text {
                    id:scoreText
                    x: sizeWidthConfig * 20
                    y: sizeHeigthConfig * (375)
                    text:score
                    font.pixelSize: sizeHeigthConfig * 20
                    font.family: "Roboto";
                    wrapMode: Text.WordWrap
                    width: sizeWidthConfig * 370
                    height: sizeHeigthConfig * 75
                    clip: true
                }

                Text {
                    id:price
                    x: sizeWidthConfig * 25
                    y: sizeHeigthConfig * (470 )
                    text: value
                    font.pixelSize: sizeHeigthConfig * 20
                    font.family: "Roboto";
                    color: "#4D4D4D"
                }
                Text {
                    id: moneyValue
                    x: sizeWidthConfig * 25 + price.width + 10
                    y: sizeHeigthConfig * (469 )
                    font.pixelSize: sizeHeigthConfig * 20
                    text: validMoney
                    font.family: "Roboto";
                    color: "#4D4D4D"
                }

            }
            DropShadow {
                anchors.fill: bulletinRect
                radius: 6.0
                opacity: 0.24

                color: "#000000"
                source: bulletinRect
            }
        }


    }
    Component.onCompleted: {
       bulletinModel.clear()
    }

    ListView {
        id: bulletinListView
        model: bulletinModel
        z:1
        y: sizeHeigthConfig * 150
        x:sizeWidthConfig * 9
        width: sizeWidthConfig *  480
        height: sizeHeigthConfig *670
        delegate: bulletinDelegate
        clip:true
        spacing: 20
        currentIndex:2
        onMovementStarted:{
            addSwipecontact.visible = false
        }
         onMovementEnded:{
            addSwipecontact.visible = true
        }

        ListModel {
            id: bulletinModel
            ListElement {
                titleTextAdd:"";
                value:0;
                score:"";
                repeaterViewModel:[];
                validMoney:'';
                phoneView:0;
                view:0;
            }

        }
        Component.onCompleted: {
            getMyOfferList("ACTIVE")
           // getMyOfferSON("COMPLETE",true,false)
        }
    }
    function appendToListView(titleOffer,priceOffer,descriptionOffer,massRepeaterViewModel,validMoneyOffer,phoneViewOffer,viewsOffer){
        bulletinModel.append({
                                 titleTextAdd:titleOffer,
                                 value:priceOffer,
                                 score:descriptionOffer,
                                 repeaterViewModel:massRepeaterViewModel,
                                 validMoney:validMoneyOffer,
                                 phoneView:phoneViewOffer,
                                 view:viewsOffer
                             });

    }

    function getMyOfferList(status){
        bulletinModel.clear()
        var request = new XMLHttpRequest()
        request.open('GET', offerListF +myId +"/" +status+offerListS, true);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    var result = JSON.parse(request.responseText)
                    for(var i = 0; i < result.length; i++){
                      getOfferFromSEOUrlActive(result[i], status)
                    }
                } else {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send()
        if (offerSEOUrl.length >0)
            getOfferFromSEOUrl()

    }

     function getOfferFromSEOUrlActive(pazl,status){
        var request = new XMLHttpRequest()
        request.open('GET', urlOfferFromSEO + pazl, true);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    var result = JSON.parse(request.responseText)
                    var massNameCurrency = ["UAH","EUR","USD"]
                    var massSimbo = ["₴","€","$"]
                    console.log(JSON.stringify(result))
                    var valueOfItem = find(massNameCurrency, result.price.amount.currency )
                    if (result.status === status)
                        appendToListView(
                                    result.title,
                                    result.price.amount,
                                    result.description,
                                    result.imageIds.map(function(item){
                                        var fullimage = [item].join(" ")
                                        return {sourceImageId:offerImgIdF + String(fullimage)+ offerImgIdS}
                                      }),
                                    massSimbo[valueOfItem],
                                    0,//result.phoneNumbers[0],
                                    0,
                                    0
                                    )

                } else {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send()
     }

    function find(array, value) {

      for (var i = 0; i < array.length; i++) {
        if (array[i] == value) return i;
      }

      return -1;
    }
}






