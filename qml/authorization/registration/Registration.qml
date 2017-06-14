import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0


Item {
    /*Image {
            id: asdasd
            source: "qrc:/image/sizeConfig/Регистрация – 3.png"
            opacity: 0.30
            z:6
        }*/
    id: registrationItem
    width: monitorWidth
    height: monitorHeigth

    Image {
        id: image
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  0
        width: sizeWidthConfig * 481
        height: sizeHeigthConfig * 92
        z:1
        source: "qrc:/image/title/blue.png"
        smooth: true
    }



    DropShadow {
        anchors.fill: image
        radius: 6.0
         z:0
        opacity: 0.24
        color: "#000000"
        source: image
    }

    ///[1] Text input the email and passwoed///
    Rectangle {
        id: line
        x: sizeWidthConfig *40
        y: sizeHeigthConfig *  355
        width: sizeWidthConfig *  400
        height: 2
        color: "#BDBDBD"
        z: -3
        smooth: true
    }
    Rectangle {
        id: line1
        x: sizeWidthConfig *40
        y: sizeHeigthConfig *  427
        width: sizeWidthConfig *  400
        height: 2
        color: "#BDBDBD"
        z: -3
        smooth: true
    }

    Rectangle {
        id: line2
        x: sizeWidthConfig *40
        y: sizeHeigthConfig *  502
        width: sizeWidthConfig *  400
        height: 2
        z: -3
        color: "#BDBDBD"
        smooth: true
    }

    TextInput {
        id: emailBox
        x:sizeWidthConfig *  40
        y:sizeHeigthConfig * 330
        width: sizeWidthConfig  * 400
        height:sizeHeigthConfig * 40
        text: qsTr("Ololo@mail.ru")
        opacity: 0.9
        renderType: Text.QtRendering
        clip:true
        font.family: "Roboto";
        inputMethodHints:Qt.ImhEmailCharactersOnly
        font.pixelSize: sizeHeigthConfig*18
    }

    TextInput {
        id: passW
        x: sizeWidthConfig *40
        y: sizeHeigthConfig *  404
        width: sizeWidthConfig *  400
        height: sizeHeigthConfig * 20
        color: "#000000"
        clip:true
        text: qsTr("qwepqwep")
        font.family: "Roboto";
        selectionColor: "#020080"
        inputMethodHints: Qt.ImhHiddenText
        font.pixelSize: sizeHeigthConfig*18
        echoMode: TextInput.Password
    }

    TextInput {
        id: repass
        x: sizeWidthConfig *40
        y: sizeHeigthConfig *  479
        width: sizeWidthConfig *  400
        height: sizeHeigthConfig * 20
        color: "#000000"
        text: qsTr("qwepqwep")
        font.family: "Roboto";
        clip:true
        echoMode: TextInput.Password
        inputMethodHints: Qt.ImhHiddenText
        selectionColor: "#020080"
        font.pixelSize: sizeHeigthConfig*18
    }



    ///[2]Lable text of logo ///
    Label {
        id: label
        x: sizeWidthConfig * 60
        y: sizeHeigthConfig * 150
        text: qsTr("Добро пожаловать в GUP")
        font.family: "Roboto";
        font.pixelSize: sizeHeigthConfig * 28
    }

    Label {
        id: label1
        x: sizeWidthConfig *  100
        y: sizeHeigthConfig * 245
        text: qsTr("Уже зарегистрированы?")
        font.pixelSize: sizeHeigthConfig* 15
        z: 3
        height: sizeHeigthConfig * 16
        font.family: "Roboto";
        color: "#999999"
    }
    Rectangle{
        id : beckRec
        x: sizeWidthConfig * 38
        y: sizeHeigthConfig * 224
        width:sizeWidthConfig * 400
        height:sizeHeigthConfig* 58
        color: "transparent"
        border.color: "#1976D2"
        border.width: 1
        radius: 5
        z:1
    }

    DropShadow {
        anchors.fill: beckRec
        radius: 6.0
        opacity: 0.66
        color: "#000000"
        source: beckRec
    }

    Rectangle{
        id:nastradamus
        x: sizeWidthConfig *58
        y: sizeHeigthConfig * 58
    }
    Rectangle {
        id: button_reg
        x: sizeWidthConfig * 273
        y: sizeHeigthConfig * 249
        z:3
        width: sizeWidthConfig * 69
        height: sizeHeigthConfig * 14
        color:  "transparent"
        radius: 7
        border.width: 1
        border.color: "transparent"

        Text {
            id: button_reg_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            text: qsTr("Вход")
            anchors.verticalCenterOffset: -2
            anchors.horizontalCenterOffset: 8
            z: 1
            color: "#1976D2"
            font.family: "Roboto";
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: sizeHeigthConfig* 15
        }
        MouseArea {
            id: button_reg_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "white"
            onExited: parent.border.color = "white"
            onClicked: {
                regSeq.start()
            }
        }
    }

    ///[4] Up ///
    Rectangle{
        x: sizeWidthConfig * 184
        y: sizeHeigthConfig //* (-20)
        width:sizeWidthConfig * 110
        height: sizeHeigthConfig * 110
        color:"#1976D2"
        radius: 9000
        z:3
        Image {
            id: image1
            z:1
            x: sizeWidthConfig * (5)
            y: sizeHeigthConfig * (5)
            width: sizeWidthConfig * 100
            height: sizeHeigthConfig * 100
            source: "qrc:/image/logo/rendition.png"
            smooth: true
        }
        DropShadow {
            anchors.fill: image1
            opacity: 0.16
            z:0
            color: "#000000"
            source: image1
        }
    }


    ///[3] All Button ///
    //reg//
    Rectangle {
        id: button_enter
        x: sizeWidthConfig * 40
        y: sizeHeigthConfig * 566
        radius: 7
        width: sizeWidthConfig * 400
        height: sizeHeigthConfig * 55
        color: button_enter_mouse_area.pressed ? "#1976D2" : "#1976D2"
        border.width: 3
        border.color: "#1976D2"

        Text {
            id: button_enter_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            text: qsTr("РЕГИСТРАЦИЯ")
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: sizeHeigthConfig*27
            font.family: "Roboto";

        }

        MouseArea {
            id: button_enter_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked:{
                var emailSub = emailBox.text
                 if ((passW.text === repass.text) && passW.text !== "" &&  repass.text !== "" ){
                    emailBox.text
                    var http = new XMLHttpRequest()
                    var url = "http://gup.com.ua:8183/api/oauth/register";
                    var params =JSON.stringify({email:emailBox.text,password:passW.text})
                    http.open("POST", url, true);
                    //Send the proper header information along with the request
                    http.setRequestHeader("Content-type", "application/json");
                    http.setRequestHeader("Content-length", params.length);
                    http.setRequestHeader("Connection", "close");
                    http.onreadystatechange = function() {
                        if(http.readyState == 4 && http.status == 200) {
                            print("ok");
                            swipeUrl = "qrc:/qml/authorization/enter/Enter.qml"
                             itemGupAutorVisible = true
                        }else{
                            passW.color = "red"
                            repass.color = "red"
                            }
                    }
                    http.send(params);


                }else{
                    passW.color = "red"
                    repass.color = "red"
                }
            }
        }

    }

    //vk//
    Image {
        id: vk
        x: sizeWidthConfig * 55
        y: sizeHeigthConfig * 635
        width: sizeWidthConfig * 55
        height:sizeHeigthConfig *  55
        z: 1
        source: "qrc:/image/logo/vk.png"
    }

    Rectangle {
        id: button_vk
        x: sizeWidthConfig *  40
        y: sizeHeigthConfig * 635
        width: sizeWidthConfig * 400
        height:sizeHeigthConfig *  55
        color: button_vk_mouse_area.pressed ? "#45668e" : "#45668e"
        radius: 7
        border.width: 3
        border.color: "#45668e"

        Text {
            id: button_vk_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            text: qsTr("VKONTAKTE")
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: sizeHeigthConfig*27
            font.family: "Roboto";
        }
        MouseArea {
            id: button_vk_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#45668e"
            onExited: parent.border.color = "#45668e"
            onClicked: rect_color_change.color = "#45668e"
        }
    }
    //fb//
    Image {
        id: fb
        x: sizeWidthConfig * 55
        y: sizeHeigthConfig * 710
        width:sizeWidthConfig *  55
        height:sizeHeigthConfig * 55
        z: 1
        source: "qrc:/image/logo/fb.png"
    }
    Rectangle {
        id: button_facebook
        x: sizeWidthConfig * 40
        y: sizeHeigthConfig * 710
        width: sizeWidthConfig * 400
        height: sizeHeigthConfig * 55
        color: button_facebook_mouse_area.pressed ? "#3b5998" : "#3b5998"
        radius: 7
        border.width: 3
        border.color: "#3b5998"

        Text {
            id: button_facebook_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            text: qsTr("FACEBOOK")
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize:sizeHeigthConfig* 27
            font.family: "Roboto";
        }
        MouseArea {
            id: button_facebook_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#3b5998"
            onExited: parent.border.color = "#3b5998"
            onClicked: rect_color_change.color = "#3b5998"
        }

    }


}
