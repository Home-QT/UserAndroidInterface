import QtQuick 2.7
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import 'qrc:/js/contractsController.js' as ContractsController

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

    Rectangle {
        Component.onCompleted: {
            ContractsController.updateContractsList()
        }
    }

    Rectangle {
        id: recSlider
        y: sizeHeigthConfig *  130
        z:6
        width: sizeWidthConfig *  480
        height: sizeHeigthConfig * 2
        color: "#1976D2"
        Slider {
            id: sliderHorizontalTab

            width: sizeWidthConfig *  480
            height: sizeHeigthConfig * 2
            value:indexCheckedInTabBar*0.5
            tickmarksEnabled: true
            //stepSize: 0.1;
            style:SliderStyle{
                groove:Rectangle{
                    id:recLine
                    y: sizeHeigthConfig * 2
                    implicitHeight: 1;
                    implicitWidth: sliderHorizontalTab.width;
                    color: "#1976D2";
                    radius: 8;
                }
                handle: Rectangle{
                    id: handleRec
                    anchors.centerIn: parent;
                    color:  "#FF3920";
                    radius: 6;
                    width: sizeWidthConfig *  240;
                    height: sizeHeigthConfig * 2;
                }
            }
        }
    }

    Rectangle {
        id: button_vk
        x: sizeWidthConfig *  25
        y: sizeHeigthConfig * 520
        width: sizeWidthConfig * 430
        height:sizeHeigthConfig *  50
        color: button_vk_mouse_area.pressed ? "#1976D2" : "#1976D2"
        radius: 7
        border.width: 3
        border.color: "#1976D2"

        Text {
            id: button_vk_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            text: qsTr("ОБНОВИТЬ")
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize:sizeHeigthConfig *  18
        }
        MouseArea {
            id: button_vk_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked: {
                contractsListModel.clear()
                 ContractsController.updateContractsList();
            }
        }
    }


    ///[1]! TabBar ///
    Rectangle{
        id:lolbar
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  90
        width: sizeWidthConfig *  480
        height: sizeHeigthConfig * 600
        TabBar {
            id: bar
            currentIndex: indexCheckedInTabBar
            Repeater {
                model: ["АКТИВНЫЕ", "ЗАВЕРШЕННЫЕ"]
                TabButton {
                    id: control
                    text: modelData
                    width:sizeWidthConfig * 240
                    height: sizeHeigthConfig * 60
                    font.pixelSize: sizeHeigthConfig* 15
                    onClicked: {

                        if (bar.currentIndex === 0 ){
                            sliderHorizontalTab.value = 0
                            dialogListAndContactList = ""
                        }
                        if (bar.currentIndex === 1 ){
                            sliderHorizontalTab.value = 1
                            dialogListAndContactList = ""
                        }
                    }
                    contentItem:
                        Text {
                        z:2
                        text: control.text
                        font: control.font
                        opacity: enabled ? 1.0 : 0.3
                        color: control.checked ? "#ffffff" : "#fcf9f9"
                        horizontalAlignment: Text.AlignHCenter

                    }


                    background: Rectangle {
                        z:0
                        y:sizeHeigthConfig * (-5)
                        width: sizeWidthConfig * 250
                        height: sizeHeigthConfig * 50
                        //opacity: enabled ? 1 : 0.3
                        color: "#1976D2"
                        //border.width: 1
                        //radius: 2
                    }
                }
            }
        }

        StackLayout{
            width: sizeWidthConfig *  parent.width
            currentIndex: bar.currentIndex

            Item {
                id: activeContract

                ListView {
                    id: contractsList
                    model: contractsListModel
                    z:0
                    y: sizeHeigthConfig * 46
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig *650
                    delegate: contractsListDelegate
                    currentIndex:2
                    clip:true
                    ListModel {
                        id: contractsListModel

                        ListElement {
                            contractId: '';
                            contracStatus:'';
                            variants: [];
                            userName:'';
                        }

                    }
                }
            }
        }
    }

    Component {
        id: contractsListDelegate

        Rectangle {
            width: sizeWidthConfig *  480; height:sizeHeigthConfig *  80
            color: "white"
            border.color: "#EEEEEE"
            border.width: 0.5
            radius: 0.5

            Column {
                spacing: 2

                Text {
                    text: contracStatus
                    wrapMode: Text.WordWrap

                }

                Text {
                    text: userName
                }

                Row {
                    spacing: 20
                    Repeater {
                        model: variants
                        delegate: buttonsDelegate
                    }
                }
            }
        }
    }

    Component {
        id: buttonsDelegate
        Rectangle{
             z:1
             width: (sizeWidthConfig *  960) / model.length; height: (sizeHeigthConfig *  40) / 2
        color:"blue"
        }
        /*Button {
            y:sizeHeigthConfig * 35
            width: (sizeWidthConfig *  960) / model.length; height: (sizeHeigthConfig *  40) / 2
            text: title
            onClicked: {
                ContractsController.pushAction(contractId, actionName);
            }
        }*/
    }



}
