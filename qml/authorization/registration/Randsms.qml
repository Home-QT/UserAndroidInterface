import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0



Item {
    id: randSmsItem
    width: monitorWidth
    height: monitorHeigth

    ///[1] Text Sms///
    TextInput {
        id: sms
        y: sizeHeigthConfig *  292
        height: sizeHeigthConfig * 32
        text: qsTr("12313213")
        font.weight: Font.Normal
        font.capitalization: Font.MixedCase
        visible: true
        clip: false
        readOnly: false
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.rightMargin: 120
        anchors.left: parent.left
        anchors.leftMargin: 120
    }

    Image {
        id: line
        x: sizeWidthConfig *150
        y: sizeHeigthConfig *  310
        width: sizeWidthConfig *  185
        height: sizeHeigthConfig * 5
        z: -3
        source: "qrc:/image/title/line.png"
        smooth: true
    }
    ///[2]Lable text of logo ///
    Label {
        id: label
        x: sizeWidthConfig *93
        y: sizeHeigthConfig *  158
        text: qsTr("Добро пожаловать в GUP")
        font.pointSize: 15
    }
    Label {
        id: label1
        x: sizeWidthConfig *133
        y: sizeHeigthConfig *  224
        width: sizeWidthConfig *  100
        height: sizeHeigthConfig * 19
        text: qsTr("Не пришло СМС?")
        z: 3
        color: "#999999"
    }
    Rectangle{
        id:nastradamus
        x: sizeWidthConfig *58
        y: sizeHeigthConfig * 58
    }
    Rectangle {
        id: button_reg
        x: sizeWidthConfig *280
        y: sizeHeigthConfig *  224
        z:3
        width: sizeWidthConfig *  50
        height: sizeHeigthConfig * 15
        color: button_reg_mouse_area.pressed ? "white" : "white"
        radius: 7
        border.width: 3
        border.color: "white"

        Text {
            id: button_reg_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            text: qsTr("Айяяй")
            color: "#1976D2"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 8
        }
        MouseArea {
            id: button_reg_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "white"
            onExited: parent.border.color = "white"
            onClicked: {
                   swipeView.setCurrentIndex(0);
            }
        }
    }

    ///[4] Up ///
    Image {
        id: image1
        x: sizeWidthConfig *167
        y: sizeHeigthConfig *  -30
        width: sizeWidthConfig *  146
        height: sizeHeigthConfig * 182
        source: "qrc:/image/logo/rendition.png"
        smooth: true
    }
    DropShadow {
        anchors.fill: image1
        radius: 6.0
        opacity: 0.66
        color: "#000000"
        source: image1
    }
    Image {
        id: image2
        x: sizeWidthConfig *120
        y: sizeHeigthConfig *  209
        width: sizeWidthConfig *  255
        height: sizeHeigthConfig * 49
        z: -4
        source: "qrc:/image/title/backtitule.png"
    }

    ///[3] All Button ///
    Rectangle {
        id: button_enter
        x: sizeWidthConfig *155
        y: sizeHeigthConfig *  480
        width: sizeWidthConfig *  170
        height: sizeHeigthConfig * 40
        color: button_enter_mouse_area.pressed ? "#1976D2" : "#1976D2"
        radius: 7
        border.width: 3
        border.color: "#1976D2"

        Text {
            id: button_enter_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            text: qsTr("Регистрация")
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
        }
        MouseArea {
            id: button_enter_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked: {
            swipeView.setCurrentIndex(2);
            }
        }

    }
}
