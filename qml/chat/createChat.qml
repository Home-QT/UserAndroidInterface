import QtQuick 2.0
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import 'qrc:/js/socketManager.js' as SocketManager

Item {
    id:menuItem
    width: monitorWidth
    height: monitorHeigth

    ///friendItems////
    Item {
        id:friendItem
        width: sizeWidthConfig *  480
        height: 800

        Loader{
            id:contactMessengerWebSocket
            source: 'qrc:/qml/websocket/GeneralWebSocket.qml'
        }

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
                id: scrMenue_mouse_area1
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.border.color = "#1976D2"
                onExited: parent.border.color = "#1976D2"
                onClicked: {
                    friendUrl = ""
                    friendUrl = "qrc:/qml/friend/Friend.qml"
                    greyBox.x == 0 ? greyBox.x = sizeWidthConfig * 480 : greyBox.x = 0//view.currentIndex = 2
                }
            }
        }
        Text {
            id: name
            text: "У вас ещё нет контактов"
        }
        ///[6]! listContact ///
        Component {
            id: contactListDataObjDelegate
            Rectangle {
                width: sizeWidthConfig *  480; height: 80
                color: "white"
                border.color: "#EEEEEE"
                border.width: 0.5
                radius: 0.5
                Rectangle{
                    x: sizeWidthConfig *10
                    y: sizeHeigthConfig * 10
                    z:4



                    Text {
                        z:5
                        x: sizeWidthConfig *350
                        y: sizeHeigthConfig * 7
                        width: sizeWidthConfig *  480
                        height: sizeHeigthConfig * 20
                        //visible:  false
                        property bool ignoreTextChange: false
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        text: ""+idUserDialog
                        font.pointSize: 10
                    }
                    Text {
                        z:5
                        x: sizeWidthConfig *320
                        y: sizeHeigthConfig * 45
                        width: sizeWidthConfig *  480
                        height: sizeHeigthConfig * 20
                        //visible:  false
                        property bool ignoreTextChange: false
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        text: ""+idFinedUser
                        font.pointSize: 6
                    }

                    Rectangle {
                            id: background
                            x: sizeWidthConfig *12.5
                            y: sizeHeigthConfig * 12.5
                            z:4
                            width: sizeWidthConfig * 45
                            height: sizeHeigthConfig * 45
                            radius: width/2

                        }
                    Image {
                        id: avaDialog
                        x: sizeWidthConfig *12.5
                        y: sizeHeigthConfig * 12.5
                        z:4
                        width: sizeWidthConfig * 45
                        height: sizeHeigthConfig * 45
                        source: scoreDialogAva
                        visible: false
                    }
                    OpacityMask {
                            id: roundedPhoto
                             z:4
                            anchors.fill: background
                            source: avaDialog
                            maskSource: background
                            //visible: (photoImage.status==Image.Ready)

                        }

                    Rectangle{

                        z:3

                        ///ava and nic ///
                        Rectangle{
                            id: circle_Dialog
                            x: sizeWidthConfig *10
                            y: sizeHeigthConfig * 10
                            z:2

                            property int posX: 0
                            property int posY: 0
                            property int size: 50
                            property string selectedColor: "white"
                            width: sizeWidthConfig *  size
                            height: sizeHeigthConfig * size
                            radius: size/2
                            color: selectedColor
                        }
                        Rectangle{
                            id: circle_Rand_Dialog
                            x: sizeWidthConfig *12.5
                            y: sizeHeigthConfig * 12.5
                            z:2

                            property int posX: 0
                            property int posY: 0
                            property int size: 45
                            property string selectedColor: '#' + ((Math.random() * 0x1000000) | 0x1000000).toString(16).substr(1)
                            width: sizeWidthConfig *  size
                            height: sizeHeigthConfig * size
                            radius: size/2
                            color: selectedColor
                        }

                        Text {
                            //id: searchBukva
                            x: sizeWidthConfig *22.5
                            y: sizeHeigthConfig * 12.5
                            z:2
                            text:dialogBukva
                            font.pointSize: 22
                            color: "white"
                        }

                        Item {
                            id : triangle
                            width: sizeWidthConfig *  28
                            height: sizeHeigthConfig * 28
                            clip : true
                            z:1.5
                            x: sizeWidthConfig *31
                            y: sizeHeigthConfig * 10

                            // The index of corner for the triangle to be attached
                            property int corner : 0;

                            Rectangle {
                                x : triangle.width * ((1+1) % 4 < 2 ? 0 : 1) - width / 2
                                y : triangle.height * (0 % 4 < 2 ? 0 : 1) - height / 2
                                z:2
                                id : rect
                                color : onlineUser ? "#14850C":"#a7a7a7"
                                antialiasing: true
                                width : Math.min(triangle.width,triangle.height)
                                height : width
                                transformOrigin: Item.Center
                                rotation : 45
                                scale : 1.414
                            }
                        }
                    }

                    Text {
                        z:5
                        x: sizeWidthConfig *85
                        y: sizeHeigthConfig * 7
                        width: sizeWidthConfig *  480
                        height: sizeHeigthConfig * 20
                        property bool ignoreTextChange: false
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        text: nicNameDialog
                        font.pointSize: 10
                    }

                }
                MouseArea{
                    x: sizeWidthConfig *85
                    y: sizeHeigthConfig * 30
                    z:5
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig * 50
                    hoverEnabled: true
                    onClicked: {
                        contactListDataObj.model({})
                    }
                }
            }

        }
        TextArea {
            id: p1input
            visible: false
        }

        ListView {
            id: contactListDataObj
            model: contactListDataObjModel
            z:-2
            y: sizeHeigthConfig * 108
            width: sizeWidthConfig *  200
            height: sizeHeigthConfig * 560
            delegate: contactListDataObjDelegate
            currentIndex:2
            ListModel {
                id: contactListDataObjModel

                ListElement {onlineUser:'';idUserDialog:'';idFinedUser:'';nicNameDialog: '';scoreDialogAva:'';textBody:'';dialogBukva:''}

            }
            add: Transition {
                NumberAnimation { properties: "y,y"; from: 0; duration: 200 }
            }
            displaced: Transition {
                NumberAnimation { properties: "y,y"; duration: 500 }
            }
        }
    }
}


