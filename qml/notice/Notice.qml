import QtQuick 2.7
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

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
        Component.onCompleted: {
            getPeopleJSON()
        }
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
        /*Здесь будут мои уведомления*/

    }

    /// NOTICE !!!!///
    Item {
        id: loadContact
        ///[6]! Notice LIST ///
        Component {
            id: listPeopleDelegate

            Rectangle {

                width: sizeWidthConfig *  480; height:sizeHeigthConfig *  80
                color: "white"
                border.color: "#EEEEEE"
                border.width: 0.5
                radius: 0.5

                Text {
                    id: noticeName
                    text: noticeNameProduct
                }

                Image {
                    id: noticeImg
                    source:noticeImgProduct
                }

                Text {
                    id: skokoStoit
                    text: skokoStoitProduct
                }

                Text{
                    id:peopleViews
                    text:  peopleViewsProduct
                }



                MouseArea{
                    x: sizeWidthConfig *85
                    y: sizeHeigthConfig * 30
                    z:5
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig * 100
                    hoverEnabled: true
                    onClicked: {


                    }
                }
            }
        }

        ListView {
            id: peopleScores
            model: peopleModel
            z:0
            //y:150
            y: sizeHeigthConfig * 108
            width: sizeWidthConfig *  200
            height: sizeHeigthConfig * 460
            delegate: listPeopleDelegate
            currentIndex:2
            OpacityAnimator on opacity{
                from: boolAnimationStarted;
                to: 1;
                duration: 500
            }
            ListModel {
                id: peopleModel

                ListElement {
                    noticeNameProduct:''
                    skokoStoitProduct:''
                    peopleViewsProduct:''
                    noticeImgProduct:''
                }

            }
            add: Transition {
                NumberAnimation { properties: "y,y"; from: 460; duration: 500 }
            }
            displaced: Transition {
                NumberAnimation { properties: "y,y"; duration: 1000 }
            }
        }

    }
}
