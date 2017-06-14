import QtQuick 2.0
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.0

Item {
    ///[2]! Scrool Menu acrivate ///
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
                swipeUrl = "qrc:/qml/friend/Friend.qml"
                swipeUrl = "qrc:/qml/menu/Menu.qml"
            }
        }
    }

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

    DropShadow {
        anchors.fill: image
        radius: 6.0
        opacity: 0.24
        z: 2
        color: "#000000"
        source: image
    }

    function getPeopleJSON() {
        var request = new XMLHttpRequest()

        request.open('GET', profilUrl+myId, true);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    var result = JSON.parse(request.responseText)
                    fio.text = result.profile.firstname + " " + result.profile.lastname
                    avaIcoS = imgUrlF + result.profile.imgId+imgUrlS
                } else {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send(0)
    }

    Rectangle{
        id: rectangle
        y:sizeHeigthConfig * 83
        width: sizeWidthConfig * 480
        height:sizeHeigthConfig *  700
        z:0
        Rectangle {
            id: atherAvatar
            x: sizeWidthConfig * 0
            width: sizeWidthConfig * 481
            height: sizeHeigthConfig * 250
            smooth: true
            color:"#1976D2"
            Component.onCompleted: {
                getPeopleJSON()
            }
        }

        Rectangle {
            id: background
            y:sizeHeigthConfig *  20
            width: sizeWidthConfig *  120
            height:sizeHeigthConfig *  120
            z: 8
            x: sizeWidthConfig * 180
            radius: 99999


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
        }
        OpacityMask {
            id: roundedPhoto
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

        ///User Name
        Text{
            id:fio
            y: sizeHeigthConfig * 162
            x: sizeWidthConfig * 25
            width:sizeWidthConfig * 430
            height: 20
            color:"white"
            text:"Unknown"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: sizeHeigthConfig * 32
        }

        ///Button redactor
        Rectangle {
            id: button_RedactorProfil
            color: button_RedactorProfil_mouse_area.pressed ? "#1976D2" : "#1976D2"
            y: sizeHeigthConfig * 251
            width: sizeWidthConfig * 480
            height: sizeHeigthConfig * 54
            anchors.topMargin: 396
            border.width: 3
            border.color: "#1976D2"

            Text {
                id: button_RedactorProfil_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  20
                text: qsTr("РЕДАКТИРОВАТЬ ПРОФИЛЬ")
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: sizeHeigthConfig * 18
            }
            MouseArea {
                id: button_RedactorProfil_mouse_area
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 1
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.border.color = "#1976D2"
                onExited: parent.border.color = "#1976D2"
                onClicked: {
                     /////////////////////////////////////////////////////////////////////
                }
            }
        }

        /// button notice
        Rectangle {
            id: button_Notice
            y: sizeHeigthConfig * 320
            width: sizeWidthConfig * 480
            height: sizeHeigthConfig * 55
            anchors.topMargin: 396

            Text {
                id: button_Notice_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  20
                text: qsTr("        Уведомления")
                color: "black"
                font.pixelSize: sizeHeigthConfig * 18
            }
            MouseArea {
                id: button_Notice_mouse_area
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 1
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                     /////////////////////////////////////////////////////////////////////
                }
            }
        }

        /// button Basic
        Rectangle {
            id: button_Basic
            y: sizeHeigthConfig * 390
            width: sizeWidthConfig * 480
            height: sizeHeigthConfig * 55
            anchors.topMargin: 396

            Text {
                id: button_Basic_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  20
                text: qsTr("        Основные")
                color: "black"
                font.pixelSize: sizeHeigthConfig * 18
            }
            MouseArea {
                id: button_Basic_mouse_area
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 1
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                     /////////////////////////////////////////////////////////////////////
                }
            }
        }

        /// button Sequr
        Rectangle {
            id: button_Sequr
            y: sizeHeigthConfig * 465
            width: sizeWidthConfig * 480
            height: sizeHeigthConfig * 55
            anchors.topMargin: 396

            Text {
                id: button_Sequr_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  20
                text: qsTr("        Безопасность")
                color: "black"
                font.pixelSize: sizeHeigthConfig * 18
            }
            MouseArea {
                id: button_Sequr_mouse_area
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 1
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                     /////////////////////////////////////////////////////////////////////
                }
            }
        }
        /// button Synchronization
        Rectangle {
            id: button_Synchronization
            y: sizeHeigthConfig * 535
            width: sizeWidthConfig * 480
            height: sizeHeigthConfig * 55
            anchors.topMargin: 396

            Text {
                id: button_Synchronization_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  20
                text: qsTr("        Синхронизация с GUP")
                color: "black"
                font.pixelSize: sizeHeigthConfig * 18
            }
            MouseArea {
                id: button_Synchronization_mouse_area
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 1
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                     /////////////////////////////////////////////////////////////////////
                }
            }
        }


        ///Button redactor
        Rectangle {
            id: button_Exit
            color: button_RedactorProfil_mouse_area.pressed ? "#1976D2" : "#1976D2"
            x: sizeWidthConfig * 25
            y: sizeHeigthConfig * 630
            radius: 7
            width: sizeWidthConfig * 430
            height: sizeHeigthConfig * 50
            anchors.topMargin: 396
            border.width: 3
            border.color: "#1976D2"

            Text {
                id: button_Exit_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  20
                text: qsTr("ВЫЙТИ")
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: sizeHeigthConfig * 18
            }
            MouseArea {
                id: button_Exit_mouse_area
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 1
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.border.color = "#1976D2"
                onExited: parent.border.color = "#1976D2"
                onClicked: {
                    var http = new XMLHttpRequest()
                    var url = "http://gup.com.ua:8183/api/oauth/logout";

                    http.open("GET", url);

                    //Send the proper header information along with the request
                    http.setRequestHeader("Content-type", "application/json");
                    http.onreadystatechange = function() {//Call a function when the state changes.
                        if(http.readyState == 4 && http.status == 200) {
                            print("ok");
                            itemGupAutorVisible = true
                            exitMode = 1
                            swipeUrl = "qrc:/qml/authorization/enter/Enter.qml"
                        }else{
                                    print("cannot connect");
                            }
                    }
                    http.send();
                }
            }
        }


    }


}
