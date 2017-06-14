import QtQuick 2.0
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import 'qrc:/js/peopleAddOrDelete/peopleAdd.js' as AddPeople
/*Manuel Riva & Eneli - Mhm Mhm (Kissfm Edit)*/

Item {
    id:aboutItem
    width: monitorWidth
    height: monitorHeigth


    ///[4] Up ///
    Image {
        id: image
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  0
        width: sizeWidthConfig * 481
        height: sizeHeigthConfig * 85
        z: 3
        source: "qrc:/image/title/blue.png"
        smooth: true

    }

    DropShadow {
        anchors.fill: image
        radius: 6.0
        opacity: 0.24
        z: 2
        color: "#000000"
        source: image
    }

    Loader{
        id: atherWebSocketLoader
        source:"qrc:/qml/websocket/GeneralWebSocket.qml"
    }


    Rectangle {
        id: scrMenue
        x: sizeWidthConfig *15
        y: sizeHeigthConfig * 22
        z:3
        width: sizeWidthConfig *  50
        height: sizeHeigthConfig * 50
        color: scrMenue_mouse_area.pressed ? "#1976D2" : "#1976D2"
        radius: 7
        border.width: 3
        border.color: "#1976D2"

        Image {
            id: scrMenue_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            source:"qrc:/image/menu/back.png"
            width: sizeWidthConfig * 18
            height: sizeHeigthConfig * 25
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            id: scrMenue_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked: {
                accountInfoBool = false
                accountMyInfoBool = false
                urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                friendUrl = ""
                friendUrl = "qrc:/qml/friend/Friend.qml"
            }
        }
    }


    function getPeopleJSON() {
        var request = new XMLHttpRequest()

        request.open('GET', profilUrl+atherUserId, true);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    var result = JSON.parse(request.responseText)
                    //console.log(JSON.stringify(result))
                    avaIcoS = imgUrlF + result.profile.imgId+imgUrlS
                    elseAvatar.source = imgUrlF + result.profile.imgId+imgUrlSLARGE
                    fio.text = result.profile.firstname + " " + result.profile.lastname
                    if (phoneReg.text !==  result.profile.mainPhoneNumber){
                    phoneReg.text =  result.profile.mainPhoneNumber
                    }else{
                    for(var j = 0; j <result.profile.contact.contactPhones.length; j++ )
                       phoneReg.text =result.profile.contact.contactPhones[j]
                    }
                     aboutUserWorck.text = result.profile.contact.companyName
                     aboutPositionWorck.text = result.profile.contact.position
                    console.log( atherUserId,myId)
                    //imageBackAvatarImage.source = imgUrlF + result.profile.imgId+imgUrlS
                    //if (result.profile.mainPhoneNumber !== ""){
                    //phoneReg.text = String(result.profile.mainPhoneNumber)
                    //    aboutUserWorck.text = result.profile.contact.companyName
                    //    aboutPositionWorck.text = result.profile.contact.position
                    //    if (result.profile.contact.contactPhones.length > 0){
                    //        for(var j = 0; j <result.profile.contact.contactPhones.length; j++ )
                    //            phoneSupport.text =result.profile.contact.contactPhones[j]
                    //    }else{
                     //       dopNumber.visible = false
                     //       osnInf.y = -100
                     //       if (result.profile.contact.companyName === ""){
                     //           osnInf.visible = false
                    //}else{
                                /*numperPeople.visible = false
                                osnInf.visible = false
                                dopNumber.visible = false*/
                     //       }
                    //    }
                    //}
                } else {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send(0)
    }

    function addPeopleJSON() {
        var request = new XMLHttpRequest()
        cacheContactList[cacheContactList.length] = atherUserId
        var urlGetUser = addContactF+atherUserId+addContactS
        request.open('POST', urlGetUser);
        request.setRequestHeader('Content-Type', 'application/json;charset=utf-8')
        request.send()
    }

    /*Image {
        z:24
        source: "qrc:/image/sizeConfig/Впервые на странице пользователя.png"
        opacity: 0.5
    }*/
    Rectangle{
        width: sizeWidthConfig * 480
        height: sizeHeigthConfig * 900
        color: "#ECECEC"
        MouseArea{
            anchors.fill: parent
            onClicked:  if (fixconfig === true){
                            elseAvatar.height ===  sizeHeigthConfig * 220 ? elseAvatar.height = sizeHeigthConfig * 480 : elseAvatar.height = sizeHeigthConfig * 220
                            elseAvatar.height ===  sizeHeigthConfig * 220 ? fastBlurBack.radius = 0 : fastBlurBack.radius = 100
                            elseAvatar.height ===  sizeHeigthConfig * 220 ? background.opacity = 0 : background.opacity = 1
                            elseAvatar.height ===  sizeHeigthConfig * 220 ? maskSmallAvatar.opacity = 0 : maskSmallAvatar.opacity = 1
                            fixconfig = false
                        }
        }
    }
    Rectangle{
        id:backImage
        y: sizeHeigthConfig * 85
        width: sizeWidthConfig * 480
        height: sizeHeigthConfig * 220
        Image {
            id: elseAvatar
            width: sizeWidthConfig * 480
            height: sizeHeigthConfig * 220
            //layer.enabled: rounded
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            smooth: true
            Behavior on height {
                NumberAnimation {
                    duration: 500
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    elseAvatar.height ===  sizeHeigthConfig * 220 ? elseAvatar.height = sizeHeigthConfig * 480 : elseAvatar.height = sizeHeigthConfig * 220
                    elseAvatar.height ===  sizeHeigthConfig * 220 ? fastBlurBack.radius = 0 : fastBlurBack.radius = 100
                    elseAvatar.height ===  sizeHeigthConfig * 220 ? background.opacity = 0 : background.opacity = 1
                    elseAvatar.height ===  sizeHeigthConfig * 220 ? maskSmallAvatar.opacity = 0 : maskSmallAvatar.opacity = 1
                    elseAvatar.height ===  sizeHeigthConfig * 220 ? fixconfig = true : fixconfig = false

                }
            }
        }
        FastBlur {
            id: fastBlurBack
            anchors.fill: elseAvatar
            source: elseAvatar
            radius: 100
            Behavior on radius {
                NumberAnimation {
                    duration: 500
                }
            }
        }
    }


    Rectangle {
        id: background
        y:sizeHeigthConfig *  100
        width: sizeWidthConfig *  120
        height:sizeHeigthConfig *  120
        z: 2
        x: sizeWidthConfig * 180
        radius: 25
        visible: false
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
    }
    Image {
        id:avaIco
        z:8
        y:sizeHeigthConfig *  100
        height:sizeHeigthConfig *  120
        width: sizeWidthConfig *  120
        x: sizeWidthConfig * 180
        visible: false
        source: avaIcoS
        fillMode: Image.PreserveAspectCrop

    }
    OpacityMask {
        id:maskSmallAvatar
        z:9
        anchors.fill: background
        source: avaIco
        maskSource: background
        opacity: 1
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }

    }

    TabBar {
        id: bar
        y: elseAvatar.height + sizeHeigthConfig * 90
        Repeater {
            model: ["ИНФОРМАЦИЯ", "ВЛОЖЕНИЯ", "ДОКУМЕНТЫ"]
            TabButton {
                id: control
                text: modelData
                onClicked: {
                    if (fixconfig === true){
                        elseAvatar.height ===  sizeHeigthConfig * 220 ? elseAvatar.height = sizeHeigthConfig * 480 : elseAvatar.height = sizeHeigthConfig * 220
                        elseAvatar.height ===  sizeHeigthConfig * 220 ? fastBlurBack.radius = 0 : fastBlurBack.radius = 100
                        elseAvatar.height ===  sizeHeigthConfig * 220 ? background.opacity = 0 : background.opacity = 1
                        elseAvatar.height ===  sizeHeigthConfig * 220 ? maskSmallAvatar.opacity = 0 : maskSmallAvatar.opacity = 1
                        fixconfig = false
                    }

                    if (bar.currentIndex === 2 ){
                        sliderHorizontalTab.value = 1
                    }
                    if (bar.currentIndex === 0 ){
                        sliderHorizontalTab.value = 0
                    }
                    if (bar.currentIndex === 1 ){

                        sliderHorizontalTab.value = 0.5
                    }
                }
                contentItem:

                    Text {
                    id:textContentItem
                    z:2
                    //x: (rectBar.width - textContentItem.contentWidth)/2
                    //y: (rectBar.height - textContentItem.contentHeight)/2
                    font.pixelSize: sizeHeigthConfig * 18
                    text: control.text
                    font.pointSize: sizeHeigthConfig * 14
                    font.bold: control.checked ? true: false
                    //opacity: enabled ? 1.0 : 0.3
                    color: control.checked ? "#ffffff" : "#fcf9f9"
                    horizontalAlignment: Text.AlignHCenter

                }

                background: Rectangle {
                    id:rectBar
                    z:0
                    y:sizeHeigthConfig * (-10)
                    width: sizeWidthConfig * 170
                    height: sizeHeigthConfig * 60
                    //opacity: enabled ? 1 : 0.3
                    color: "#1976D2"
                    //border.width: 1
                    //radius: 2
                }

                width:sizeWidthConfig * 160
            }
        }
    }
    Rectangle {
        id: recSlider
        y: elseAvatar.height + sizeHeigthConfig * 80 + sizeHeigthConfig * 60
        z:6
        width: sizeWidthConfig * 480
        height: sizeHeigthConfig * 1
        color: "#1976D2"
        Slider {
            id: sliderHorizontalTab

            width: sizeWidthConfig * 480
            height:sizeHeigthConfig *  2
            value:0.0
            tickmarksEnabled: true
            //stepSize: 0.1;
            style:SliderStyle{
                groove:Rectangle{
                    id:recLine
                    y:sizeHeigthConfig * (-2)
                    height: sizeHeigthConfig * 1;
                    width:sizeWidthConfig *  sliderHorizontalTab.width;
                    color: "#1976D2";
                    radius: 8;
                }
                handle: Rectangle{
                    id: handleRec
                    anchors.centerIn: parent;
                    color:  "#FF3920";
                    radius: 6;
                    width: sizeWidthConfig * 160;
                    height: sizeHeigthConfig * 2;
                }
            }
        }
    }
    ///User Name
    Text{
        id:fio
        y: elseAvatar.height
        x: sizeWidthConfig * 25
        width:sizeWidthConfig * 430
        height: 20
        z: 8
        color:"white"
        text:"Unknown"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: sizeHeigthConfig * 32
    }
    StackLayout{
        width:sizeWidthConfig  * parent.width
        currentIndex: bar.currentIndex
        y: elseAvatar.height + sizeHeigthConfig * 80 + sizeHeigthConfig * 30

        Item {
            id: button1

            Rectangle {
                id: button_send
                x: sizeWidthConfig * 22
                y: sizeHeigthConfig * 50
                width: sizeWidthConfig * 195
                height: sizeHeigthConfig * 60
                color:  button_send_mouse_area.pressed ? "#1976D2" : "#1976D2"
                radius: 7
                border.width: 3
                border.color: "#1976D2"
                visible: atherUserId === myId ? false : true
                Text {
                    id:  button_send_label
                    x:sizeWidthConfig * 38
                    y:sizeHeigthConfig * 5
                    text: qsTr("НАПИСАТЬ\nПОЛЬЗОВАТЕЛЮ")
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.right: parent.right
                    anchors.left: parent.left
                    font.pixelSize: sizeHeigthConfig * 20
                }
                MouseArea {
                    id:  button_send_mouse_area
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.border.color = "#1976D2"
                    onExited: parent.border.color = "#1976D2"
                    onClicked:{
                        accountInfoBool = false
                        accountMyInfoBool = false
                        firstClick = "true"
                        createTetChat = "Yes"
                        urlBilderForWebSocket = "qrc:/qml/chat/Chat.qml"
                        swipeByChatConfig=""
                        swipeByChatConfig = "qrc:/qml/chat/Chat.qml"
                        timerSwipe.start()
                    }
                }

            }

            Rectangle {
                id: button_add
                x: sizeWidthConfig * 255
                y: sizeHeigthConfig * 50
                width: sizeWidthConfig * 195
                height: sizeHeigthConfig * 60
                color:  button_add_mouse_area.pressed ? "#1976D2" : "#1976D2"
                radius: 7
                border.width: 3
                border.color: "#1976D2"
                visible: atherUserId === myId ? false : true
                Text {
                    id: button_add_label
                    x: sizeWidthConfig * 50
                    y:sizeHeigthConfig * 5
                    text: qsTr("ДОБАВИТЬ В\nКОНТАКТЫ")
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.right: parent.right
                    anchors.left: parent.left
                    font.pixelSize: sizeHeigthConfig * 18
                }
                MouseArea {
                    id:  button_add_mouse_area
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.border.color = "#1976D2"
                    onExited: parent.border.color = "#1976D2"
                    onClicked: {
                        AddPeople.addUserToMyContactList()
                        accountInfoBool = false
                        accountMyInfoBool = false
                        urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                        friendUrl = ""
                        friendUrl = "qrc:/qml/friend/Friend.qml"

                    }
                }
            }


            Item {
                id:numperPeople
                /// основной номер
                visible: phoneReg.text !== "" ? true : false
                Rectangle{
                    id: phoneNumberOsn
                    x:sizeWidthConfig * 20
                    y:  atherUserId === myId ?  sizeHeigthConfig * 75 :  sizeHeigthConfig * 133
                    z:1
                    width: sizeWidthConfig * 430
                    height:sizeHeigthConfig * 84
                    Image {
                        id: cooling
                            width: sizeWidthConfig *   35
                            height: sizeHeigthConfig * 35
                            z:1
                            x: sizeWidthConfig *22.5
                            y: sizeHeigthConfig * 22.5
                        source: "qrc:/image/accounts/colling.png"
                    }
                    Rectangle{
                        id: circle_Rand_Dialog
                        x:sizeWidthConfig * 15
                        y:sizeHeigthConfig * 15
                        z:0
                        property string selectedColor: "#DCEAF8"
                        width: sizeWidthConfig *  50
                        height: sizeHeigthConfig * 50
                        radius: 9999
                        color: selectedColor
                    }
                    Label{
                        x:sizeHeigthConfig * 81
                        y:sizeHeigthConfig * 15
                        text:"Контактный телефон"
                        font.pixelSize:sizeHeigthConfig * 20
                    }
                    Label{
                        id:phoneReg
                        x:sizeHeigthConfig * 81
                        y:sizeHeigthConfig * 48
                        text:""
                        font.pixelSize:sizeHeigthConfig * 18
                        color:"grey"
                    }

                    Rectangle{
                        width: sizeHeigthConfig *  3
                        height: sizeHeigthConfig * 84
                        color:"#1976D2"
                        x: sizeWidthConfig *428

                    }
                    Rectangle{
                        width: sizeHeigthConfig *  40
                        height: sizeHeigthConfig * 40
                        x:sizeWidthConfig * 370
                        y:sizeHeigthConfig * 23
                        Text {
                            id: addPhoneToContactList
                            x: sizeWidthConfig *18
                            y: 0
                            width: sizeWidthConfig *  34
                            height: sizeHeigthConfig * 47
                            text: qsTr("+")
                            color:"#1976D2"
                            font.bold: true
                            font.pixelSize:sizeHeigthConfig * 28
                        }
                    }
                }

                DropShadow {
                    anchors.fill: phoneNumberOsn
                    radius: 6.0
                    opacity: 0.66
                    color: "#000000"
                    source: phoneNumberOsn
                }
            }
            /// основная инфа
            Item {
                id: osnInf
                visible: (position.text === "") && (worck.text === "") ? false : true
                Rectangle{
                    id: aboutUser
                    z:1
                    x:sizeWidthConfig * 20
                    y: atherUserId === myId ? phoneReg.text !== "" ?  sizeHeigthConfig * 175 : sizeHeigthConfig * 75 : phoneReg.text !== "" ?  sizeHeigthConfig * 233 : sizeHeigthConfig * 133
                    width: sizeWidthConfig * 430
                    height:(worck.height + aboutUserWorck.height+position.height+aboutPositionWorck.height) *1.5
                    Image {
                        id: chemodenchik
                        width: sizeWidthConfig *   55
                        height: sizeHeigthConfig * 55
                        z:1
                        x: sizeWidthConfig *12.5
                        y: sizeHeigthConfig * 12
                        source: "qrc:/image/accounts/distr.png"
                    }
                    Rectangle{
                        id: chemodenchik_Rand_Dialog
                        x: sizeWidthConfig *15
                        y: sizeHeigthConfig * 15
                        z:0
                        property string selectedColor: "#DCEAF8"
                        width: sizeWidthConfig *  50
                        height: sizeHeigthConfig * 50
                        radius: 99999
                        color: selectedColor
                    }
                    Label{
                        id:worck
                        x:sizeHeigthConfig * 81
                        y:sizeHeigthConfig * 15
                        text:aboutUserWorck.text === "" ? "" :"Место работы"
                        font.pixelSize:sizeHeigthConfig * 20
                        height: aboutUserWorck.text === "" ? 4 : worck.contentHeight
                    }
                    Label{
                        id:aboutUserWorck
                        x:sizeHeigthConfig * 81
                        y:sizeHeigthConfig * 48
                        text:""
                        font.pixelSize:sizeHeigthConfig * 18
                        color:"grey"
                        height: aboutUserWorck.text === "" ? 4 : aboutUserWorck.contentHeight
                    }

                    Label{
                        id:position
                        x: sizeHeigthConfig * 81
                        y: aboutUserWorck.text === "" ? sizeHeigthConfig * 15 : sizeHeigthConfig * 70
                        text:aboutPositionWorck.text === "" ? "" :"Должность"
                        font.pixelSize:sizeHeigthConfig * 20
                        height: aboutPositionWorck.text === "" ? 4 : position.contentHeight
                    }
                    Label{
                        id:aboutPositionWorck
                        x:sizeHeigthConfig * 81
                        y:aboutUserWorck.text === "" ? sizeHeigthConfig * 48 : sizeHeigthConfig * 100
                        text:""
                        font.pixelSize:sizeHeigthConfig * 18
                        color:"grey"
                        height: aboutPositionWorck.text === "" ? 4 : aboutPositionWorck.contentHeight
                    }

                    Rectangle{
                        width: sizeHeigthConfig *  3
                        height: (worck.height + aboutUserWorck.height+position.height+aboutPositionWorck.height)*1.5
                        color:"#1976D2"
                        x: sizeWidthConfig *428

                    }
                }
                DropShadow {
                    anchors.fill: aboutUser
                    radius: 6.0
                    opacity: 0.66
                    color: "#000000"
                    source: aboutUser
                }
            }



        }
    }









     Component.onCompleted: {
         getPeopleJSON()
     }

     Timer {
         id:timerSwipe
         interval: 150; running: false; repeat: true

         onTriggered:{
             greyBox.x == 0 ? greyBox.x = sizeWidthConfig * 480 : greyBox.x = 0
             //greyBox.x == 0 ?opacityGrayBoxDown.start():opacityGrayBoxUP.start()
             timerSwipe.stop()
         }
     }

/*    Rectangle{
        id: rectangle
        y:sizeHeigthConfig * 83
        width: sizeWidthConfig * 480
        height:sizeHeigthConfig *  700
        z:0
        color:"blue"
        Component.onCompleted: {
            getPeopleJSON()
        }
        Behavior on height {
            NumberAnimation {
                duration: 1000
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {

            }
        }


         Image {
            id:imageBackAvatarImage
            width: imageBackAvatarImage.sourceSize.height
            height:  imageBackAvatarImage.sourceSize.height
            source: imgUrlF+myImgId+imgUrlSLARGE
            fillMode: Image.PreserveAspectCrop
            visible:false

        }

         /*OpacityMask {
             id: roundedPhoto
             z:5
             anchors.fill: rectangle
             source: imageBackAvatarImage
             maskSource: rectangle
             //visible: (roundedPhoto.status==Image.Ready)
         }*/
/*        FastBlur {
            id: fastBlurBack
               anchors.fill: imageBackAvatarImage
               source: imageBackAvatarImage
               radius: 100
               Behavior on radius {
                   NumberAnimation {
                       duration: 1000
                   }
               }
           }


        Rectangle {
            id: background
            y:sizeHeigthConfig *  20
            width: sizeWidthConfig *  120
            height:sizeHeigthConfig *  120
            z: 8
            x: sizeWidthConfig * 180
            radius: 25
        }
        Image {
            id:avaIco
            z:8
            y:sizeHeigthConfig *  20
            height:sizeHeigthConfig *  120
            width: sizeWidthConfig *  120
            x: sizeWidthConfig * 180
            visible: false
            source: avaIcoS
            fillMode: Image.PreserveAspectCrop

        }
        OpacityMask {
            z:9
            anchors.fill: background
            source: avaIco
            maskSource: background

        }




        ///[9]ava ico ///
        Rectangle{
            id: circle_Rand
            x:sizeWidthConfig * 180
            y:sizeHeigthConfig * 20
            width: sizeWidthConfig * 120
            height: sizeHeigthConfig *  120
            z:5

            property int posX: 0
            property int posY: 0
            property int size: 45
            property string selectedColor: '#' + ((Math.random() * 0x1000000) | 0x1000000).toString(16).substr(1)
            color: selectedColor
            radius: 99999
        }

        Text {
            id: bukvaAlf
            x:sizeWidthConfig * 213
            y:sizeHeigthConfig * 33
            z:7
            text:bykvaNameInTheUserName
            font.pointSize: 43
            color: "white"
        }


        Item {
            id : component
            width:sizeWidthConfig *  60
            height: sizeWidthConfig * 60
            clip : true
            z:2.5
            x:sizeWidthConfig * 240
            y:sizeWidthConfig * 22

            // The index of corner for the triangle to be attached
            property int corner : 0;

            Rectangle {
                x : component.width * ((2+1) % 4 < 2 ? 0 : 1) - width / 2
                y : component.height * (0 % 4 < 2 ? 0 : 1) - height / 2
                z:2
                id : statusOnline
                color : peopleStatusOnlireOrNotColor ? "#14850C":"#a7a7a7"
                antialiasing: true
                width : Math.min(component.width,component.height)
                height : width
                transformOrigin: Item.Center
                rotation : 45
                scale : 1.414
            }
        }




        Rectangle{
            y:sizeHeigthConfig * 220
            width: sizeWidthConfig * 480
            height: sizeHeigthConfig * 700
            color:"#F2F2F2"
            ////// Slider



            DropShadow {
                anchors.fill: recSlider
                radius: 6.0
                opacity: 0.66
                color: "#000000"
                source: recSlider
            }


            ///tab bar

     /*       TabBar {
                id: bar

                Repeater {
                    model: ["ИНФОРМАЦИЯ", "ВЛОЖЕНИЯ", "ДОКУМЕНТЫ"]

                    TabButton {
                        id: control
                        text: modelData
                        onClicked: {
                            if (bar.currentIndex === 2 ){

                                sliderHorizontalTab.value = 1
                            }
                            if (bar.currentIndex === 0 ){
                                sliderHorizontalTab.value = 0
                            }
                            if (bar.currentIndex === 1 ){

                                sliderHorizontalTab.value = 0.5
                            }
                        }
                        contentItem:

                            Text {
                            z:2
                            font.pixelSize: sizeHeigthConfig * 16
                            text: control.text
                            font.pointSize: 10
                            font.bold: control.checked ? true: false
                            //opacity: enabled ? 1.0 : 0.3
                            color: control.checked ? "#ffffff" : "#fcf9f9"
                            horizontalAlignment: Text.AlignHCenter

                        }

                        background: Rectangle {
                            z:0
                            y:sizeHeigthConfig * (-5)
                            width: sizeWidthConfig * 170
                            height: sizeHeigthConfig * 40
                            //opacity: enabled ? 1 : 0.3
                            color: "#1976D2"
                            //border.width: 1
                            //radius: 2
                        }

                        width:sizeWidthConfig * 160
                    }
                }
            }
            Timer {
                id:timerSwipe
                interval: 150; running: false; repeat: true

                onTriggered:{
                    greyBox.x == 0 ? greyBox.x = sizeWidthConfig * 480 : greyBox.x = 0
                    //greyBox.x == 0 ?opacityGrayBoxDown.start():opacityGrayBoxUP.start()
                    timerSwipe.stop()
                }
            }*/
            /*StackLayout{
                width:sizeWidthConfig  * parent.width
                currentIndex: bar.currentIndex

                    Text{
                       id:atherPeopleId
                       text:atherUserId
                       visible: false
                       objectName: "contactAtherId"
                    }


                    /// дополнительный номер

                    Item {
                        id: dopNumber
                        Rectangle{
                            id: phoneNumberSupport
                            x: sizeWidthConfig *30
                            y: sizeHeigthConfig * 220
                            z:1
                            width: sizeWidthConfig *  420
                            height: sizeHeigthConfig * 80
                            Image {
                                id: coolingSupport
                                width: sizeWidthConfig *   30
                                height: sizeHeigthConfig * 30
                                z:1
                                x: sizeWidthConfig *22.5
                                y: sizeHeigthConfig * 22.5
                                source: "qrc:/image/accounts/colling.png"
                            }
                            Rectangle{
                                id: circleSupport_Rand_Dialog
                                x: sizeWidthConfig *15
                                y: sizeHeigthConfig * 15
                                z:0
                                property string selectedColor: "#DCEAF8"
                                width: sizeWidthConfig *  45
                                height: sizeHeigthConfig * 45
                                radius: 9999
                                color: selectedColor
                            }
                            Label{
                                x: sizeWidthConfig *90
                                y: sizeHeigthConfig * 10
                                text:"Контактный телефон"
                                font.pointSize: 10
                            }
                            Label{
                                id:phoneSupport
                                x: sizeWidthConfig *90
                                y: sizeHeigthConfig * 40
                                text:""
                                font.pointSize: 10
                                color:"grey"
                            }

                            Rectangle{
                                width: sizeWidthConfig *  5
                                height: sizeHeigthConfig * 80
                                color:"#1976D2"
                                x: sizeWidthConfig *415

                            }
                            Rectangle{
                                width: sizeWidthConfig *  70
                                height: sizeHeigthConfig * 70
                                x: sizeWidthConfig *340
                                y: sizeHeigthConfig * 5
                                Text {
                                    id: addSupportPhoneToContactList
                                    x: sizeWidthConfig *18
                                    y: sizeHeigthConfig *  0
                                    width: sizeWidthConfig *  34
                                    height: sizeHeigthConfig * 47
                                    text: qsTr("+")
                                    color:"blue"
                                    font.pointSize: 28
                                }
                            }
                        }
                        DropShadow {
                            anchors.fill: phoneNumberSupport
                            radius: 6.0
                            opacity: 0.66
                            color: "#000000"
                            source: phoneNumberSupport
                        }
                    }

                    /// основная инфа
                    Item {
                        id: osnInf


                        Rectangle{
                            id: aboutUser
                            z:1
                            x: sizeWidthConfig *30
                            y: sizeHeigthConfig * 320
                            width: sizeWidthConfig *  420
                            height: sizeHeigthConfig * 160
                            Image {
                                id: chemodenchik
                                width: sizeWidthConfig *   50
                                height: sizeHeigthConfig * 50
                                z:1
                                x: sizeWidthConfig *12.5
                                y: sizeHeigthConfig * 12
                                source: "qrc:/image/accounts/distr.png"
                            }
                            Rectangle{
                                id: chemodenchik_Rand_Dialog
                                x: sizeWidthConfig *15
                                y: sizeHeigthConfig * 15
                                z:0
                                property int posX: 0
                                property int posY: 0
                                property int size: 45
                                property string selectedColor: "#DCEAF8"
                                width: sizeWidthConfig *  size
                                height: sizeHeigthConfig * size
                                radius: size/2
                                color: selectedColor
                            }
                            Label{
                                x: sizeWidthConfig *90
                                y: sizeHeigthConfig * 10
                                text:"Место работы"
                                font.pointSize: 10
                            }
                            Label{
                                id:aboutUserWorck
                                x: sizeWidthConfig *90
                                y: sizeHeigthConfig * 40
                                text:""
                                font.pointSize: 10
                                color:"grey"
                            }

                            Label{
                                x: sizeWidthConfig *90
                                y: sizeHeigthConfig * 70
                                text:"Должность"
                                font.pointSize: 10
                            }
                            Label{
                                id:aboutPositionWorck
                                x: sizeWidthConfig *90
                                y: sizeHeigthConfig * 100
                                text:""
                                font.pointSize: 10
                                color:"grey"
                            }

                            Rectangle{
                                width: sizeWidthConfig *  5
                                height: sizeHeigthConfig * 160
                                color:"red"
                                x: sizeWidthConfig *415

                            }
                        }
                        DropShadow {
                            anchors.fill: aboutUser
                            radius: 6.0
                            opacity: 0.66
                            color: "#000000"
                            source: aboutUser
                        }
                    }
                }
            }*/
   /*     }
    }
*/}
