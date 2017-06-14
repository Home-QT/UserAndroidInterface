import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0

Item {

    Loader{
        id:infoLoader
        source: "qrc:/qml/websocket/GeneralWebSocket.qml"
    }
    //right ok

    Image {
        id: littleAddChat
        z:6
        x:sizeWidthConfig * 400
        y:sizeHeigthConfig * 18
        width: sizeWidthConfig * 10
        height: sizeHeigthConfig * 10
        source: "qrc:/image/chat/ic_done_24px.svg"
        visible: false
    }
    ColorOverlay {
        z:6
        id:littleAddedChat
        anchors.fill: littleAddChat
        source: littleAddChat
        color: "white"
        opacity: 1
    }

    Rectangle{
        id:accountInfo
        width:monitorWidth
        height: monitorHeigth
        z:7
        visible: accountInfoBool

        Loader{
            z:2
            id:loaderAboutAther

        }
    }

    ///[2]! Scrool Menu acrivate ///
    Rectangle {
        id: scrMenue
        y: sizeHeigthConfig * 8
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
        ShaderEffectSource {
            sourceItem:scrMenue_label
            recursive:true
        }
        MouseArea {
            id: scrMenue_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked: {

                urlBilderForWebSocket =  "qrc:/qml/grup/grupChatStile.qml"
                friendUrl = ""
                friendUrl = "qrc:/qml/grup/grupChatStile.qml"
                whiteBox.x == 0 ? whiteBox.x = sizeWidthConfig * 480 : whiteBox.x = 0
            }
        }
    }
    Image {
        id: image
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  0
        width: sizeWidthConfig *  481
        height: sizeHeigthConfig * 75
        z: 1
        source: "qrc:/image/title/blue.png"
        smooth: true
    }

    Rectangle {
         y:sizeHeigthConfig * 75
         width: sizeWidthConfig * 480
         height: sizeHeigthConfig * 820
         color:"#F2F2F2"
         Rectangle{
             id:nameOdDialog
             z:1
             y:sizeHeigthConfig * 10
             x:sizeWidthConfig * 20
            width: sizeWidthConfig * 440
            height: (textNameDialog.contentHeight+20)
            TextInput{
                id: textNameDialog;
                wrapMode: TextInput.Wrap;
                y:(nameOdDialog.height - textNameDialog.contentHeight)/2
                x:sizeWidthConfig * 10
                clip: true
                width:sizeWidthConfig * (420)
                text: focus ? nameOfTheDialog.text === "" ? "" : nameOfTheDialog.text
                : nameOfTheDialog.text === "" ? "Название чата" : nameOfTheDialog.text;
                font.family: "Roboto";
                opacity: focus ? 1 :0.38
                font.pixelSize: sizeHeigthConfig *  28
                Text{
                    id: nameOfTheDialog;
                    text: "";
                    font.family: "Roboto";
                }
            }
         }

         DropShadow {
             anchors.fill: nameOdDialog
             radius: 6.0
             opacity: 0.32
             color: "#000000"
             source: nameOdDialog
         }



         Rectangle{
             id:addNewPersonRect
             height:sizeHeigthConfig *  50
             width: sizeWidthConfig *  440
             x:sizeWidthConfig * 20
             y:textNameDialog.contentHeight +sizeHeigthConfig * 50
             z:3
             Rectangle{
                 id:addNewPerson
                 height: personAdd.height
                 width: personAdd.width

                 Image {
                     id: personAdd
                     x:sizeWidthConfig * 5
                     y: (addNewPersonRect.height- personAdd.height  )/ 2
                     source: "qrc:/image/chat/person-add.svg"
                     visible: false
                     height :sizeHeigthConfig *  40
                     width: sizeWidthConfig *  40
                     sourceSize.height: personAdd.height
                     sourceSize.width: personAdd.width
                 }
                 ColorOverlay {
                     id:imgIntelectPersonAdd
                     anchors.fill: personAdd
                     source: personAdd
                     color:   "#1976D2"
                 }
                 Text {
                     id:textAddPerson
                     x:sizeHeigthConfig *  60
                     y: (addNewPersonRect.height- textAddPerson.contentHeight  )/ 2
                     text: qsTr("Добавить контакт")
                     font.pixelSize: sizeHeigthConfig * 20
                     color: "#1976D2"
                     opacity: 0.75
                 }

             }
             MouseArea{
                anchors.fill: parent
                onClicked:{console.log("AddNew")}
             }
         }

         DropShadow {
             anchors.fill: addNewPersonRect
             radius: 6.0
             z:2
             opacity: 0.18
             color: "#000000"
             source: addNewPersonRect
         }

         Rectangle{
            id:listRect
            width: sizeWidthConfig *  440
            height: sizeHeigthConfig * 320
            y:textNameDialog.contentHeight + addNewPersonRect.height +sizeHeigthConfig * 50
            x:sizeWidthConfig * 20
            z:1

            ListView {
                id: peopleScores
                model: peopleModel

                //y:150
                clip: true
                width: sizeWidthConfig *  440
                height: sizeHeigthConfig * 320
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
                        onlineUserSearch:'';
                        finedUserId:'';
                        textPhone: '';
                        nicName:'';
                        scorePeopleAva:"";
                        searchBukva:"";
                        rectcolorit:''
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

         DropShadow {
             anchors.fill: listRect
             radius: 6.0
             opacity: 0.35
             color: "#000000"
             source: listRect
         }

         Rectangle{
            id:switchRect
            width: sizeWidthConfig *  440
            x:sizeWidthConfig * 20
            y:textNameDialog.contentHeight + addNewPersonRect.height +sizeHeigthConfig * 75 + listRect.height
            height: sizeHeigthConfig * 50 + (nameHaste.height +sizeHeigthConfig * 20 )
            z:1
            Text {
                id: nameHaste
                y:sizeHeigthConfig *10
                text: qsTr("Уведомления")
                x:switchRect.width /10
                opacity: 0.5
                font.pixelSize: sizeHeigthConfig * 20
            }
            Switch {
                id: control
                text: qsTr("Звук")
                y:(sizeHeigthConfig * 75 - control.height)/2 +  nameHaste.height
                indicator: Rectangle {
                    implicitWidth: 48
                    implicitHeight: 26
                    x: control.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 13
                    color: control.checked ? "#1976D2" : "#ffffff"
                    border.color: control.checked ? "#1976D2" : "#cccccc"

                    Rectangle {
                        x: control.checked ? parent.width - width : 0
                        width: 26
                        height: 26
                        radius: 13
                        color: control.down ? "#cccccc" : "#ffffff"
                        border.color: control.checked ? (control.down ? "#1976D2" : "#1976D2") : "#999999"
                    }
                }

                contentItem: Text {
                    text: control.text
                    font: control.font
                    opacity: enabled ? 1.0 : 0.3
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: control.indicator.width + control.spacing
                }
            }

         }
         DropShadow {
             anchors.fill: switchRect
             radius: 6.0
             opacity: 0.35
             color: "#000000"
             source: switchRect
         }

         Rectangle{
             id:exitRect
            width: sizeWidthConfig *  440
            x:sizeWidthConfig * 20
            y:textNameDialog.contentHeight + addNewPersonRect.height +sizeHeigthConfig * 100 + listRect.height  + switchRect.height
            height: sizeHeigthConfig * 50
            z:1
            Text {
                id:exitText
                x: (exitRect.width - exitText.contentWidth) / 2
                y: (exitRect.height- exitText.contentHeight  )/ 2
                text: qsTr("ПОКИНУТЬ ДИАЛОГ")
                font.pixelSize: sizeHeigthConfig * 20
                color: "#1976D2"
                opacity: 0.75
            }
         }

         DropShadow {
             anchors.fill: exitRect
             radius: 6.0
             opacity: 0.35
             color: "#000000"
             source: exitRect
         }

    }

    Item{
        id:contactItem
        visible: false

        Rectangle{
            id:contact
            height:   sizeHeigthConfig * 450
            width: sizeWidthConfig * 380
            x: sizeWidthConfig * 50
            y: sizeWidthConfig * 90
            z:1
            ///[6]! listContact ///


            Rectangle{
                x : sizeWidthConfig *5
                y : sizeHeigthConfig * (textNameDialog.contentHeight+15)
                height: sizeHeigthConfig * 2
                width: sizeWidthConfig * 360
                color: "#009688"
            }

            Loader{
                id:reloadedWebSocket
            }
            Rectangle{
                width: sizeWidthConfig * 100
                height: sizeHeigthConfig * 50
                x:sizeWidthConfig * 280
                y:sizeHeigthConfig * 400
                Text {
                    x: (sizeWidthConfig * 100)/4
                    y:(sizeHeigthConfig * 50)/4

                    text: qsTr("OK")
                    color: "#009688"
                    font.pixelSize: sizeHeigthConfig * 18
                    font.family: "Roboto";
                }
                MouseArea {
                    id: ok_area

                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: {
                        switchOptionalRightMenue = 1

                        reloadedWebSocket.source = "qrc:/qml/websocket/GeneralWebSocket.qml"

                        if (contactItem.visible == false)
                            contactItem.visible = true
                        else
                            contactItem.visible = false
                    }
                }
            }

            Rectangle{
                width: sizeWidthConfig * 100
                height: sizeHeigthConfig * 50
                x:sizeWidthConfig * 150
                y:sizeHeigthConfig * 400
                Text {
                    font.family: "Roboto";
                    x: (sizeWidthConfig * 100)/4
                    y:(sizeHeigthConfig * 50)/4
                    id: cancel
                    text: qsTr("ОТМЕНА")
                    color: "#009688"
                    font.pixelSize: sizeHeigthConfig * 18
                }
                MouseArea {
                    id: cancel_area

                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: {
                        if (contactItem.visible == false)
                            contactItem.visible = true
                        else
                            contactItem.visible = false
                    }
                }
            }
        }
        DropShadow {
            anchors.fill: contact
            radius: 6.0
            opacity: 0.66
            color: "#000000"
            source: contact
        }
        PropertyAnimation { id: animation;
            target: peopleScores;
            property: "height";
            from:animationContactGrupChatTrue;
            to: sizeHeigthConfig * 320;
            duration: 500
        }
        PropertyAnimation { id: animation1;
            target: peopleScores;
            property: "height";
            from:sizeHeigthConfig * 320;
            to: animationContactGrupChatFalse;
            duration: 500
        }
    }

    Component {
        id: listPeopleDelegate

        Rectangle {

            width: sizeWidthConfig *  440; height:sizeHeigthConfig *  80
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
                    x: sizeWidthConfig *320
                    y: sizeHeigthConfig * 45
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig * 20
                    visible:  false
                    property bool ignoreTextChange: false
                    wrapMode: Text.WordWrap
                    text: ""+finedUserId
                    font.pointSize: 6
                    font.family: "Roboto";
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
                    id: avaSerchPeople
                    x: sizeWidthConfig *12.5
                    y: sizeHeigthConfig * 12.5
                    z:4
                    visible: false
                    width: sizeWidthConfig * 45
                    height: sizeHeigthConfig * 45
                    source: scorePeopleAva
                }
                OpacityMask {
                    id: roundedPhoto
                    z:5
                    anchors.fill: background
                    source: avaSerchPeople
                    maskSource: background

                }

                Rectangle{

                    z:rectcolorit ? 3 : 5

                    ///ava and nic ///

                    Rectangle{
                        id: circle_Rand
                        x: sizeWidthConfig *12.5
                        y: sizeHeigthConfig * 12.5
                        z:2

                        property int posX: 0
                        property int posY: 0
                        property int size: 45
                        property string selectedColor: '#' + ((Math.random() * 0x1000000) | 0x1000000).toString(16).substr(1)
                        width: sizeWidthConfig *  size
                        height: sizeHeigthConfig * size
                        radius: 9999
                        color: selectedColor
                    }

                    Text {
                        //id: searchBukva
                        x: sizeWidthConfig *22.5
                        y: sizeHeigthConfig * 12.5
                        z:2
                        text:searchBukva
                        font.pointSize: 22
                        color: "white"
                        font.family: "Roboto";
                    }


                    Item {
                        id : component
                        width: sizeWidthConfig *  28
                        height: sizeHeigthConfig * 28
                        clip : true
                        z:1.5
                        x: sizeWidthConfig *31
                        y: sizeHeigthConfig * 10

                        // The index of corner for the triangle to be attached
                        property int corner : 0;

                        Rectangle {
                            id:peopleStatusOnlireOrNot
                            x : component.width * ((1+1) % 4 < 2 ? 0 : 1) - width / 2
                            y : component.height * (0 % 4 < 2 ? 0 : 1) - height / 2
                            z:2
                            color : onlineUserSearch ? "#14850C":"#a7a7a7"
                            antialiasing: true
                            width : Math.min(component.width,component.height)
                            height : width
                            transformOrigin: Item.Center
                            rotation : 45
                            scale : 1.414
                        }
                    }
                }

                MouseArea{
                    z:5
                    width: sizeWidthConfig *  55
                    height: sizeHeigthConfig * 90
                    hoverEnabled: true
                    onClicked: {
                        peopleStatusOnlireOrNotColor = onlineUserSearch
                        atherUserId = finedUserId
                        accountInfoBool = true
                        loaderAboutAther.source = ""
                        loaderAboutAther.source = "qrc:/qml/accounts/Ather.qml"
                    }
                }

                Text {
                    x: sizeWidthConfig *85
                    y: sizeHeigthConfig * 30
                    z:5
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig * 20
                    property bool ignoreTextChange: false
                    wrapMode: Text.WordWrap
                    text: textPhone
                    color:"grey"
                    font.pointSize: 8
                    font.family: "Roboto";
                }


                Text {
                    z:5
                    x: sizeWidthConfig *85
                    y: sizeHeigthConfig * 15
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig * 20
                    property bool ignoreTextChange: false
                    wrapMode: Text.WordWrap
                    text: nicName
                    font.pointSize: 10
                    font.family: "Roboto";
                }
            }

            MouseArea{
                x: sizeWidthConfig *85
                y: sizeHeigthConfig * 30
                z:5
                width: sizeWidthConfig *  480
                height: sizeHeigthConfig * 100
                hoverEnabled: true
                onClicked: {
                    atherUserId = finedUserId
                    accountInfoBool = true
                    loaderAboutAther.source = ""
                    loaderAboutAther.source = "qrc:/qml/accounts/Ather.qml"
                }
            }
        }
    }
    TextArea {
        id: peopleInput
        visible: false
        font.family: "Roboto";
    }


}






