import QtQuick 2.7
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    Component.onCompleted: {peopleModel.clear()}
    Loader{
        id:contactList
        source: "qrc:/qml/websocket/GeneralWebSocket.qml"

    }

    Text{
        id: cantCreate
        x:(monitorWidth - cantCreate.contentWidth)/2
        y:(monitorHeigth - cantCreate.contentHeight)/2
        font.pixelSize: sizeHeigthConfig * 20
        text: "У вас ещё нет контактов"
        color: "#CFD8DC"

    }

    Rectangle{
        id:blueRectangleLittleAdd
        y:sizeHeigthConfig *690
        x:sizeWidthConfig * 380
        z:5
        width: sizeWidthConfig * 70
        height: sizeHeigthConfig * 70
        radius:9999
        visible: createGrupChatVisible
        color:"#1976D2"
        Image {
            id: littleAddChat
            z:6
            x:sizeWidthConfig * 18
            y:sizeHeigthConfig * 18
            width: sizeWidthConfig * 30
            height: sizeHeigthConfig * 30
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
        MouseArea{
            anchors.fill: parent
            onClicked: {
                var serchcCeckImageVisible = []
                for(var i = 0 ;i < peopleScores.count;i++){
                    if (peopleModel.get(i).checkImageVisible === true)
                    serchcCeckImageVisible[serchcCeckImageVisible.length] = peopleModel.get(i).idFined
                console.log("peopleModel.get(i).finedUserId ->",peopleModel.get(i).finedUserId)
                }
                console.log("serchcCeckImageVisible ->",serchcCeckImageVisible, serchcCeckImageVisible.length)
                listPeopleAddToChat = serchcCeckImageVisible
                if (serchcCeckImageVisible.length === 0){

                }
                else{
                    listPeopleAddToChat = serchcCeckImageVisible
                    whiteBox.x == 0 ? whiteBox.x = sizeWidthConfig * 480 : whiteBox.x = 0
                    urlBilderForWebSocket ='qrc:/qml/grup/selectedPeople.qml'
                    peopleWhoSelectedURL = ""
                    peopleWhoSelectedURL = 'qrc:/qml/grup/selectedPeople.qml'
                }

            }
        }
    }

    DropShadow {
        anchors.fill: blueRectangleLittleAdd
        radius: 10.0
        opacity: 0.32
        z:4
        y:10
        color: "#000000"
        source: blueRectangleLittleAdd
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
            id: scrMenue_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked: {
                urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                friendUrl = ""
                friendUrl = "qrc:/qml/friend/Friend.qml"
                greyBox.x == 0 ? greyBox.x = sizeWidthConfig * 480 : greyBox.x = 0//view.currentIndex = 2
            }
        }
    }

    Image {
        id: image
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  0
        width: sizeWidthConfig *  481
        height: sizeHeigthConfig * 85
        z: 2
        source: "qrc:/image/title/blue.png"
        smooth: true

    }


    DropShadow {
        anchors.fill: image
        radius: 6.0
        opacity: 0.24
        z: 1
        color: "#000000"
        source: image
    }

    /// CONTACT !!!!///
    Item {
        id: loadContact

        ///[6]! listContact ///
        Component {
            id: listPeopleDelegate

            Rectangle {
                width: sizeWidthConfig *  480; height:sizeHeigthConfig * 87
                color: "white"
                border.color: "#EEEEEE"
                border.width: 0.5
                radius: 0.5
                Rectangle{
                    x: sizeWidthConfig *10
                    y: sizeHeigthConfig * 10
                    z:4
                    Image {
                              y: sizeHeigthConfig * (87 -checkImage.sourceSize.height)/4
                              x: sizeWidthConfig * 400
                              id: checkImage
                              visible: checkImageVisible
                              source: "qrc:/image/chat/ic_check_24px.svg"
                              sourceSize.width: parent.width
                              sourceSize.height: parent.height
                            }
                    ColorOverlay {
                           visible: checkImage.visible
                           anchors.fill: checkImage
                           source: checkImage
                           color: "#1976D2"
                       }

                    Text {
                        z:5
                        x: sizeWidthConfig *350
                        y: sizeHeigthConfig * 7
                        width: sizeWidthConfig *  480
                        height: sizeHeigthConfig * 20
                        visible:  false
                        property bool ignoreTextChange: false
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        text: ""+idFined
                        font.family: "Roboto";
                        font.pixelSize: sizeHeigthConfig * 8
                    }
                    Rectangle {
                        id: background
                        x: sizeWidthConfig * 0
                        y: sizeHeigthConfig * 5
                        z:4
                        width: sizeWidthConfig * 55
                        height: sizeHeigthConfig * 55
                        radius: width/2

                    }
                    Image {
                        id: avaSerchPeople
                        x: sizeWidthConfig * 0
                        y: sizeHeigthConfig * 5
                        z:4
                        visible:false
                        width: sizeWidthConfig * 55
                        height: sizeHeigthConfig * 55
                        source: scorePeopleAva
                    }
                    ShaderEffectSource {
                        sourceItem:avaSerchPeople
                        recursive:true
                    }
                    OpacityMask {
                        id: roundedPhoto
                        z:5
                        anchors.fill: background
                        source: avaSerchPeople
                        maskSource: background
                        //visible: (photoImage.status==Image.Ready)
                    }



                    Rectangle{

                        z:rectcolorit ? 3 : 5

                        ///ava and nic ///

                        Rectangle{
                            id: circle_Rand
                            x: sizeWidthConfig * 0
                            y: sizeHeigthConfig * 5
                            z:2

                            property int posX: 0
                            property int posY: 0
                            property int size: 55
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
                            font.pixelSize: sizeHeigthConfig * 22
                            color: "white"
                            font.family: "Roboto";
                        }


                        Item {
                            id : component
                            width: sizeWidthConfig *  30
                            height: sizeHeigthConfig * 30
                            clip : true
                            z:1.5
                            x: sizeWidthConfig *25
                            y: sizeHeigthConfig * 5

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
                                rotation : 50
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
                            swipeUrl = "qrc:/qml/accounts/Ather.qml"
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
                        Layout.fillWidth: true
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
                        Layout.fillWidth: true
                        text: nicName
                        font.pixelSize: sizeHeigthConfig * 18
                        font.family: "Roboto";
                    }

                }
                MouseArea{
                    x: sizeWidthConfig *85
                    y: sizeHeigthConfig * 30
                    z:5
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig * 100
                    onClicked: {
                        if (checkImageVisible === false){
                        checkImageVisible = true
                        console.log(peopleScores.count)
                        }else{
                            checkImageVisible= false
                        }
                    }
                }
            }
        }
        TextArea {
            id: peopleInput
            visible: false
        }
        Rectangle {
            id: rectContact
            width: root.width / 2
            height: root.height / 2
            transformOrigin: Item.BottomRight
            x:sizeWidthConfig * 165
            y:sizeHeigthConfig * 300
            color:"#1976D2"
            opacity: 0.5
            visible:true
            transform: Scale {
                id: transformContact
                origin {
                    x: rectContact.width
                    y: rectContact.height
                }
            }

            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                // Top right
                ParallelAnimation {
                    NumberAnimation {
                        target: transformContact; property: "xScale"; from: 1; to: -1; duration: 500; easing.type: Easing.OutQuint
                    }

                    SequentialAnimation {
                        NumberAnimation {
                            target: transformContact; property: "yScale"; from: 1; to: 1.4; duration: 250; easing.type: Easing.OutQuart
                        }

                        NumberAnimation {
                            target: transformContact; property: "yScale"; from: 1.4; to: 1; duration: 250; easing.type: Easing.OutQuart
                        }
                    }
                }

                // Bottom right
                ParallelAnimation {
                    NumberAnimation {
                        target: transformContact; property: "yScale"; from: 1; to: -1; duration: 500; easing.type: Easing.OutQuint
                    }

                    SequentialAnimation {
                        NumberAnimation {
                            target: transformContact; property: "xScale"; from: -1; to: -1.4; duration: 250; easing.type: Easing.OutQuart
                        }

                        NumberAnimation {
                            target: transformContact; property: "xScale"; from: -1.4; to: -1; duration: 250; easing.type: Easing.OutQuart
                        }
                    }
                }

                // Bottom left
                ParallelAnimation {
                    NumberAnimation {
                        target: transformContact; property: "xScale"; from: -1; to: 1; duration: 500; easing.type: Easing.OutQuint
                    }

                    SequentialAnimation {
                        NumberAnimation {
                            target: transformContact; property: "yScale"; from: -1; to: -1.4; duration: 250; easing.type: Easing.OutQuart
                        }

                        NumberAnimation {
                            target: transformContact; property: "yScale"; from: -1.4; to: -1; duration: 250; easing.type: Easing.OutQuart
                        }
                    }
                }

                // Top left
                ParallelAnimation {
                    NumberAnimation {
                        target: transformContact; property: "yScale"; from: -1; to: 1; duration: 500; easing.type: Easing.OutQuint
                    }

                    SequentialAnimation {
                        NumberAnimation {
                            target: transformContact; property: "xScale"; from: 1; to: 1.4; duration: 250; easing.type: Easing.OutQuart
                        }

                        NumberAnimation {
                            target: transformContact; property: "xScale"; from: 1.4; to: 1; duration: 250; easing.type: Easing.OutQuart
                        }
                    }
                }
            }
        }


        ListView {
            id: peopleScores
            model: peopleModel
            z:0
            //y:150
            y: sizeHeigthConfig * 113
            width: sizeWidthConfig *  480
            height: sizeHeigthConfig *670
            delegate: listPeopleDelegate
            currentIndex:2
            clip:true
            OpacityAnimator on opacity{
                from: boolAnimationStarted;
                to: 1;
                duration: 500
            }
            ListModel {
                id: peopleModel

                ListElement {
                    onlineUserSearch:'';
                    idFined:'';
                    textPhone: '';
                    nicName:'';
                    scorePeopleAva:"";
                    searchBukva:"";
                    rectcolorit:'';
                    checkImageVisible:false;
                }

            }

        }

    }
}
