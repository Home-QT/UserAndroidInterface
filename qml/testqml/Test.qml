import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0

Item {
    Rectangle {
        width: 500
        height: 500
        color: "white"

        Column {
            anchors.fill: parent
            spacing: (height - happyButton.height - sadButton.height - title.height) / 3

            Text {
                id: title
                color: "black"
                font.pixelSize: parent.width / 20
                text: "How are you feeling?"
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
            }

            Image {
                id: happyButton
                height: parent.height / 5
                fillMode: Image.PreserveAspectFit
                source: "qrc:/image/logo/fb.png"
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true

                Behavior on scale {
                    PropertyAnimation {
                        duration: 100
                    }
                }


            }

            Image {
                id: sadButton
                height: parent.height / 5
                fillMode: Image.PreserveAspectFit
                source: "qrc:/image/logo/gm.png"
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true

                Behavior on scale {
                    PropertyAnimation {
                        duration: 100
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: notificationClient.notification = "User is sad :("
                    onPressed: sadButton.scale = 0.9
                    onReleased: sadButton.scale = 1.0
                }
            }
        }
    }

}






