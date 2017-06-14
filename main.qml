import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.VirtualKeyboard 2.1
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.VirtualKeyboard 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.0

//import "qrc:/js/socketManager.js" as SocketManager

ApplicationWindow {
    visible: true
    width: 480
    height: 800
    title: qsTr("GUP")
    id: root

    ///[4] Up ///
    Image {
        id: image
        x: 0
        y: 0
        width: 481
        height: 85
        z: -3
        source: "qrc:/image/image title/blue.png"
        smooth: true
    }
    Image {
        id: image1
        x: 167
        y: -30
        width: 146
        height: 182
        source: "qrc:/image/image logo/rendition.png"
        smooth: true
    }
    DropShadow {
        anchors.fill: image
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        z: -2
        anchors.leftMargin: 0
        samples: 17
        color: "#80000000"
        source: image
    }
    DropShadow {
        anchors.fill: image1
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: image1
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 2
        Loader {
             id: smsGup
             source: "qrc:/qml/authorization/registration/Randsms.qml"
          }

       Loader {
            id: regGup
            source: "qrc:/qml/authorization/registration/Registration.qml"
         }

       Loader {
            id: enterGup
            source: "qrc:/qml/authorization/enter/Enter.qml"
         }

       Loader {
            id: menueGup
            source: "qrc:/qml/menu/Menu.qml"
         }
    }

   /*footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("1")
            id: tab1
        }
        TabButton {
            text: qsTr("2")
            id:tab2
        }
        TabButton {
            text: qsTr("3")
            id:tab3

        }
    }*/
}
