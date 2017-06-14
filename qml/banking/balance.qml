import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id:chatItem
    width: monitorWidth
    height: monitorHeigth

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
                urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                friendUrl = ""
                friendUrl = "qrc:/qml/friend/Friend.qml"
                greyBox.x == 0 ? greyBox.x = sizeWidthConfig * 480 : greyBox.x = 0
            }
        }
    }
    Image {
        id: imageq
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  0
        width: sizeWidthConfig *  481
        height: sizeHeigthConfig * 85
        z: 1
        source: "qrc:/image/title/blue.png"
        smooth: true
        Component.onCompleted: {


        }
    }
    /*Rectangle{
        y: sizeHeigthConfig * 100
        width: monitorWidth
        height: sizeHeigthConfig * 700
        Label{
            x: sizeWidthConfig *140
            y: sizeHeigthConfig * 100
            id:balanceTitle
            text: "Текущий баланс"
            font.pointSize: 14
            font.bold: true
        }

        Label{
            x: sizeWidthConfig *140
            y: sizeHeigthConfig * 180
            id:balanceStatus
            text: "100$"
            font.pointSize: 48
        }

        Rectangle {
            id: button_pay
            x: sizeWidthConfig *210
            y: sizeHeigthConfig *  360
            z:3
            width: sizeWidthConfig *  50
            height: sizeHeigthConfig * 15
            color: button_pay_mouse_area.pressed ? "white" : "white"
            radius: 7
            border.width: 3
            border.color: "white"

            Text {
                id: button_pay_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  18
                text: qsTr("История транзакций")
                color: "#1976D2"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 14
            }
            MouseArea {
                id: button_pay_mouse_area
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.border.color = "white"
                onExited: parent.border.color = "white"
                onClicked: {
                    //swipeView.setCurrentIndex(2);
                }
            }
        }*/


      /* Rectangle {
            id: cart_enter
            x: sizeWidthConfig *120
            y: sizeHeigthConfig *  510
            width: sizeWidthConfig *  240
            height: sizeHeigthConfig * 45
            color: cart_enter_mouse_area.pressed ? "#1976D2" : "#1976D2"
            radius: 7
            border.width: 3
            border.color: "#1976D2"

            Text {
                id: cart_enter_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  18
                text: qsTr("Привязать карту")
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16

            }
            MouseArea {
                id: cart_enter_mouse_area
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.border.color = "#1976D2"
                onExited: parent.border.color = "#1976D2"
                onClicked:{
                    swipeView.setCurrentIndex(0);
                }
            }
        }*/

        /*Rectangle {
            id: pay_enter
            x: sizeWidthConfig *120
            y: sizeHeigthConfig *  570
            width: sizeWidthConfig *  240
            height: sizeHeigthConfig * 45
            color: cart_enter_mouse_area.pressed ? "#1976D2" : "#1976D2"
            radius: 7
            border.width: 3
            border.color: "#1976D2"

            Text {
                id: pay_enter_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  18
                text: qsTr("Привязать карту")
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16

            }
            MouseArea {
                id: pay_enter_mouse_area
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.border.color = "#1976D2"
                onExited: parent.border.color = "#1976D2"
                onClicked:{
                    swipeView.setCurrentIndex(0);
                }
            }
        }

    }*/
}
