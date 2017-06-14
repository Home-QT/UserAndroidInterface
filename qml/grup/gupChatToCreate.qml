import QtQuick 2.0
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.0
import QtQuick 2.7
import QtQuick.Particles 2.0
import QtQuick.Controls.Styles 1.4
import Qt.labs.calendar 1.0
import QtMultimedia 5.8


Item {
    id:chatItem
    width: monitorWidth
    height: monitorHeigth
    Loader{
        source: notificationLoader
    }


    MediaPlayer {
        id: playDown
        source: "https://notificationsounds.com/message-tones/all-eyes-on-me-465/download/mp3"
    }
    MediaPlayer {
        id: musickPut
        source: "https://notificationsounds.com/message-tones/put-down-272/download/mp3"
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
                urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                friendUrl = ""
                friendUrl = "qrc:/qml/friend/Friend.qml"
                lightWiteBox.x == 0 ? lightWiteBox.x = sizeWidthConfig * 480 : lightWiteBox.x = 0
            }
        }
    }


    ///[4] Up ///

    Loader{
        id:loaderWebSocketChat
        asynchronous: true
        source:"qrc:/qml/websocket/GeneralWebSocket.qml"
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
        Component.onCompleted: {
            p1model.clear()
            seqr = 0

        }
    }
    AnimatedImage  {
        id: wtriteMe
        width: sizeWidthConfig *  67
        height: sizeHeigthConfig * 48
        //x:60
        y: sizeHeigthConfig * 500
        source: "qrc:/image/accounts/writer.gif"
        visible: false
    }

    DropShadow {
        anchors.fill: image
        radius: 6.0
        opacity: 0.24
        color: "#000000"
        source: image
    }


    TextInput{
        id: textToken;
        font.family: "Roboto";
        //text: autor();
    }


    ///ava and nic ///

    Label{
        id:nameMyFriend
        z:3
        x: sizeWidthConfig *065
        y: sizeHeigthConfig * 15
        width: sizeWidthConfig *  350
        height: sizeHeigthConfig * 70
        text:"Имя чата не задано"
        color:"white"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize:sizeHeigthConfig * 18
        font.bold:true
        clip: true
        font.family: "Roboto";
    }

    Rectangle {
        id: button_enter
        color: button_enter_mouse_area.pressed ? "#1976D2" : "#1976D2"
        x: sizeWidthConfig * 25
        y: sizeHeigthConfig * 30
        z:2
        radius: 7
        width: sizeWidthConfig * 430
        height: sizeHeigthConfig * 40
        anchors.topMargin: 396
        border.width: 3
        border.color: "#1976D2"

        Text {
            id: button_enter_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            color: "white"
            opacity: 0.47
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: sizeHeigthConfig * 18
            font.family: "Roboto";
        }

        MouseArea {
            id: button_enter_mouse_area
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 1
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked: {
                if (contactItem.visible == false){
                    contactItem.visible = true
                    animationContactGrupChatTrue = 0
                    animation.running = true
                }
                else{
                    animationContactGrupChatFalse = 0
                    animation1.running = true
                    timerLoader.start()
                }
            }
        }
    }
    Timer {
        id:timerLoader
        interval: 500; repeat: true
        onTriggered: {

            if (peopleScores.height >= animationContactGrupChatTrue)
                contactItem.visible = false
            timerLoader.stop()
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
            Component {
                id: listPeopleDelegate

                Rectangle {

                    width: sizeWidthConfig *  380; height:sizeHeigthConfig *  80
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
                            Layout.fillWidth: true
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
                            atherUserId =  finedUserId
                            swipeUrl = "qrc:/qml/accounts/Ather.qml"
                        }
                    }
                }
            }
            TextArea {
                id: peopleInput
                visible: false
                font.family: "Roboto";
            }

            ListView {
                id: peopleScores
                model: peopleModel
                z:0
                //y:150
                clip: true
                y: sizeHeigthConfig * 70
                width: sizeWidthConfig *  380
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
            TextInput{
                id: textNameDialog;
                wrapMode: TextInput.Wrap;
                y:sizeHeigthConfig * 6
                x:sizeWidthConfig * 10
                clip: true
                width:sizeWidthConfig * 380
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
                    id: name
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


    Rectangle{
        id:hintName
        width: nameUser.width+20
        height: nameUser.height*2
        color: "#212121"
        z:8
        visible: false
        radius: height/6
        x: (monitorWidth-hintName.width)/2
        y: sizeHeigthConfig * 670
        opacity: 0.7
        border.color: "black"

        Text {
            x:10
            y:5
            id: nameUser
            text: nameOfTheClickUser
            color: "white"
            font.family: "Roboto";
            font.pixelSize: sizeHeigthConfig *16
        }
    }



    Timer {
        id:timerflicable
        interval: 500; running: true; repeat: true
        onTriggered:{
            if (flickable.contentY>4 && flickable.contentY<400){
                flickableUp.start()
                flickableDown.stop()
            }
            if (flickable.contentY=== 800){
                mapLoader.source =  "qrc:/qml/testqml/Test.qml"
                flickableUp.stop()
                flickableDown.stop()
            }
            if (flickable.contentY>400 && flickable.contentY<800){
                flickableDown.start()
                flickableUp.stop()
            }
        }
    }

    PropertyAnimation {id:flickableUp; target: flickable; property: "contentY"; to:800;duration: 500}
    PropertyAnimation {id:flickableDown; target: flickable; property: "contentY"; to:0;duration: 500}
    Timer {
        id:timer
        interval: 500; running: false; repeat: true
        onTriggered:{
            timeIntervat = timeIntervat + timer.interval
            if (timeIntervat === 3000){
                hintName.visible = false
                timeIntervat = 0
                timer.stop()
            }
        }
    }

    Component {
        id: delegate

        Column {
            anchors.right: itsMeSend ? parent.right : undefined
            spacing: 6
            OpacityAnimator on opacity{
                    target:messageRow;
                    from: 0;
                    to: 1;
                    duration: 500
                }
            Row {
                id: messageRow
                x: itsMessage ? sizeWidthConfig * 5:(itsMeSend ? -7 :  5)
                spacing: 12
                anchors.right: itsMeSend ? parent.right : undefined
                //property alias color : lineWhoWrite.color

                Rectangle {
                    id: background
                    x: sizeWidthConfig *12.5
                    y: /*sizeHeigthConfig * 12.5*/ score.height-sizeHeigthConfig * 27
                    z:4
                    width: sizeWidthConfig * 60
                    height: sizeHeigthConfig * 60
                    radius: width/2
                    visible:itsMessage ? false : (itsMeSend ? false:true)
                    Image {
                        id: imagePeopleAvatar
                        x: sizeWidthConfig *12.5
                        y: sizeHeigthConfig * 12.5
                        z:4
                        visible: false
                        width: sizeWidthConfig * 60
                        height: sizeHeigthConfig * 60
                        source: counter ? imagePeopleAtherAvatar :"qrc:/image/title/tratata.png"
                    }
                    OpacityMask {
                        id: roundedPhoto
                        z:5
                        anchors.fill: background
                        source: imagePeopleAvatar
                        maskSource: background

                        //visible: (photoImage.status==Image.Ready)
                        MouseArea{
                            id:mouseArea
                            anchors.fill:parent
                            onEntered:{
                                timer.start()
                                nameOfTheClickUser = UserName
                                hintName.visible = true
                            }
                        }
                    }
                }


                Rectangle {
                    z:15

                    id:messageRectangle
                    width: ( Math.min( (score.implicitWidth +24),  (p1scores.width -62 - messageRow.spacing)))
                    height: itsMessage?
                                (itsBulletin ?
                                     (bulletinRect.height)
                                   :  (score.implicitHeight+15+imageAutorBulletin.implicitHeight)
                                 )

                              : (score.implicitHeight+15)
                    color: itsMessage ? "white" : (itsMeSend ? "#1976D2" : "lightgrey")
                    radius: 17
                    y:itsMessage ? sizeHeigthConfig * (0):0
                    border.width: itsMessage ? 0: 0
                    border.color: itsMessage ? "lightgrey":"white"

                    Rectangle{
                        id:bulletinRect
                        width: 400 + score.implicitWidth
                        height:  280 + score.implicitHeight
                        z:1
                        color: "white"
                        visible:  itsMessage ?  (itsBulletin ? "true":""):""
                        SwipeView {
                            id: view
                            currentIndex: 1
                            width: 400
                            clip: true
                            height:  190 + score.implicitHeight
                            y:imageAutorBulletin.height+10
                            visible:  itsMessage ?  (itsBulletin ? "true":""):""


                            Image {
                                id: billetinImage
                                clip: true
                                width:400
                                height: 190
                                source:itsMessage ?  (itsBulletin ? imgBulletin:""):""
                            }



                            Image {
                                id: billetinImage1
                                width:400
                                height: 190
                                clip: true
                                source:itsMessage ?  (itsBulletin ?imgBulletin1:""):""
                            }



                            Image {
                                id: billetinImage2
                                width:400
                                height: 190
                                clip: true
                                source:itsMessage ?  (itsBulletin ? imgBulletin2:""):""
                            }


                        }

                        Text {
                            id: infoSmall
                            text: shortTextBulletin
                            font.pixelSize: sizeHeigthConfig * 20
                            x:5
                            y:imageAutorBulletin.height+billetinImage.height+15
                            font.family: "Roboto";
                        }

                        Rectangle {
                            id: imageAutorBulletin
                            x: sizeWidthConfig *12.5
                            y:sizeHeigthConfig * 5

                            z:4
                            width: sizeWidthConfig * 45
                            height: sizeHeigthConfig * 45
                            radius: width/2
                            Image {
                                id: imagePeopleAutorBulletin
                                x: sizeWidthConfig *12.5
                                y: sizeHeigthConfig * 12.5
                                z:4
                                visible: false
                                width: sizeWidthConfig * 45
                                height: sizeHeigthConfig * 45
                                source: bulletinAvatar
                            }
                            OpacityMask {
                                id: roundedPhotoImageAutorBulletin
                                z:5
                                anchors.fill: imageAutorBulletin
                                source: imagePeopleAutorBulletin
                                maskSource: imageAutorBulletin

                                //visible: (photoImage.status==Image.Ready)
                                MouseArea{
                                    id:clickedAutor
                                    anchors.fill:parent
                                    onEntered:{
                                        timer.start()
                                        nameOfTheClickUser = UserName
                                        hintName.visible = true
                                    }
                                }
                                ShaderEffectSource {
                                    sourceItem:imageAutorBulletin
                                    recursive:true
                                }
                                //}
                            }
                            PageIndicator {
                                id: indicator
                                count: view.count
                                currentIndex: view.currentIndex
                                y:billetinImage2.height +30
                                x:150
                            }

                            Text{
                                id:titleBulletin
                                text:titleLogoBulletin
                                x:70
                                font.pixelSize: sizeHeigthConfig * 25
                                font.family: "Roboto";
                            }
                        }
                    }
                    DropShadow {
                        anchors.fill: bulletinRect
                        visible:  itsMessage ?  (itsBulletin ? "true":""):""
                        radius: 6.0
                        opacity: 0.66
                        color: "#000000"
                        source: bulletinRect
                    }

                    Image{
                        x:itsMeSend ? score.width-11 : -5
                        y:itsMeSend ? score.height-13: score.height-10
                        id:imgIntelectWhoWrite
                        visible: false

                        source:counter ? (itsMeSend ?  "qrc:/image/chat/Bubble.svg" : "qrc:/image/chat/BubbleAther.svg") :""
                    }

                    ColorOverlay {
                        id:imgIntelectWhoWriteColor
                        anchors.fill: imgIntelectWhoWrite
                        source: imgIntelectWhoWrite
                        color:  itsMeSend ? "#1976D2" : "lightgrey"
                        visible: itsMessage ? false : true
                    }

                    Text{
                        text:UserName
                        visible: false
                        font.family: "Roboto";
                    }
                    Text{
                        id: score
                        z:2
                        text:  itsMessage ?( itsBulletin ? "":("Пользователь " + "<b>"+UserName+"</b>"+ " " + itsTime)): (itsMeSend ? myTextScore : elseTextScore)
                        color: itsMessage ? "lightgrey" : (itsMeSend ? "white" : "black")
                        anchors.fill: parent
                        anchors.margins: 12
                        lineHeight: 1.5
                        wrapMode:Label.Wrap
                        font.pixelSize: itsMessage ? sizeHeigthConfig * 14 :sizeHeigthConfig * 18
                        font.family: "Roboto";
                    }

                    Rectangle {
                        id:timeRec
                        x : itsMessage ? 0 :(itsMeSend ?   (messageRow.width + messageRow.spacing +14) : sizeWidthConfig* (440+14))// * ((0+1) % 4 < 2 ? 0 : 1) - 5/ 2
                        y : sizeHeigthConfig * 15// * (5    % 4 < 2 ? 0 : 1) - 5 / 2
                        z:-1
                        width : timeMessage.width
                        height : 5
                        Text{
                            id: timeMessage
                            x : itsMessage ? 0 :(itsMeSend ?   12 : 0)
                            y : 0
                            text: textTime
                            color:"white"
                            font.family: "Roboto";
                            font.pointSize: 8
                        }
                    }
                }
            }
        }
    }



    TextArea {
        id: p1input
        y:0
        x:0
        width: 0
        height: 0
        font.family: "Roboto";
    }



    Rectangle{
        id:shadowMenue
        width: sizeWidthConfig * 480
        height: sizeHeigthConfig * 800
        color:"black"
        visible: false
        opacity: 0.14

    }
    Rectangle{
        id:rectShadow
        z:4
        visible: false
        width: sizeWidthConfig * 480
        height: sizeHeigthConfig  * 1600
        color: "#212121"
        opacity: 0.14
        MouseArea{
            anchors.fill:parent
            onClicked: {
                rectShadow.visible = false
                menu.close()

            }
        }

    }
    ///[3]! Right Menu activete ///
    Rectangle {
        id: rm
        x: sizeWidthConfig *420
        y: sizeHeigthConfig * (-2)
        z:3
        width: sizeWidthConfig *  40
        height: sizeHeigthConfig * 70
        color:  "#1976D2"
        border.width: sizeWidthConfig * 3
        border.color: "#1976D2"

        Image {
            x:sizeWidthConfig * 27
            y:sizeHeigthConfig * 23
            width: sizeWidthConfig * imageRightMenue.implicitWidth*1.5
            height: sizeHeigthConfig * imageRightMenue.implicitHeight*1.5
            id: imageRightMenue
            source: "qrc:/image/chat/ic_more_vert_white.png"
        }
        MouseArea {
            id: rm_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked: {
                menu.open();
                    animationContactGrupChatFalse = 0
                    animation1.running = true
                    timerLoader.start()

                rectShadow.visible = true
            }
        }
        Menu {
            width: sizeWidthConfig * 180
            height: sizeHeigthConfig * 90
            id: menu
            x: sizeWidthConfig * (-100)
            y: sizeHeigthConfig *  78

            MenuItem {
                width: sizeWidthConfig * 180
                height: sizeHeigthConfig *30
                MouseArea {
                    id: addcont
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    hoverEnabled: true
                    Text{
                        x: sizeWidthConfig *10
                        // id: addfriend
                        text:"Добавить контакт"
                        horizontalAlignment :Text.AlignHCenter
                        color:"black"
                        font.pixelSize:sizeHeigthConfig * 16
                        font.family: "Roboto";
                    }
                    onClicked: {
                        // swipeUrl = "qrc:/qml/chat/createChat.qml"
                        menu.close();

                    }
                }
            }


            MenuItem {
                width: sizeWidthConfig * 180
                height: sizeHeigthConfig *30
                Text{
                    // id: addfriend
                    x: sizeWidthConfig *10
                    text:"Изменить имя чата"
                    color:"black"
                    font.pixelSize:sizeHeigthConfig * 16
                    horizontalAlignment :Text.AlignHCenter
                    font.family: "Roboto";
                }
                onClicked: {
                    if (contactItem.visible == false){
                        contactItem.visible = true
                    }
                    else{
                        contactItem.visible = false

                    }
                }

            }
            /*SoundEffect {
                 id: playSound
                 source: "qrc:/music/sms.wav"
             }*/

            MenuItem {
                width: sizeWidthConfig * 180
                height: sizeHeigthConfig *30
                Text{
                    // id: addfriend
                    x: sizeWidthConfig *10
                    text:"Выйти с чата"
                    color:"black"
                    font.pixelSize:sizeHeigthConfig * 16
                    horizontalAlignment :Text.AlignHCenter
                    font.family: "Roboto";
                }
                onClicked: {
                    switchOptionalRightMenue = 2

                    reloadedWebSocket.source = "qrc:/qml/websocket/GeneralWebSocket.qml"

                    if (contactItem.visible == false)
                        contactItem.visible = true
                    else
                        contactItem.visible = false
                }

            }
            background: Rectangle {
                id:bgMenueRight
                implicitWidth: 100
                implicitHeight: 40
                border.color: "white"

            }
        }
    }


    Flickable{
        id:flickable
        width:sizeWidthConfig *  480
        height: sizeHeigthConfig * 800
        contentHeight:sizeHeigthConfig * 800
        z:-1
        rebound: Transition {
            NumberAnimation {
                properties: "y,y"
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }

        ListView {
            id: p1scores
            model: p1model
            y: sizeHeigthConfig * 75
            z:-1
            x: sizeWidthConfig *7
            width: sizeWidthConfig *  456
            height: sizeHeigthConfig * 620
            delegate: delegate
            spacing:3
            clip:true
            //onVerticalLayoutDirectionChanged:{console.log(p1model.count)}
            //onVerticalVelocityChanged:  {console.log(p1model.count)}
            Keys.onUpPressed: p1scores.decrementCurrentIndex()
            Keys.onDownPressed: p1scores.incrementCurrentIndex()
            verticalLayoutDirection: ListView.BottomToTop
            ListModel {
                id: p1model
                ListElement {
                    itsMessage: "";
                    itsTime:"";
                    itsMeSend:"";
                    elseTextScore:"";
                    myTextScore:"";
                    textTime:"";
                    counter:'';
                    imagePeopleAtherAvatar:'';
                    UserName:"";
                    itsBulletin:'';
                    bulletinAvatar:'';
                    titleLogoBulletin:'';
                    imgBulletin:'';
                    imgBulletin1:'';
                    imgBulletin2:'';
                    shortTextBulletin:''
                }
            }

            displaced: Transition {
                NumberAnimation { id: up;properties: "y,y"; duration: 100 }
            }

        }

        Rectangle{
            width:sizeWidthConfig *  440
            height:sizeHeigthConfig * 50 + sizeHeigthConfig * (massageArea.contentHeight)
            y: sizeHeigthConfig * 735 - sizeHeigthConfig * (massageArea.contentHeight)
            x: sizeWidthConfig * 20
            color:"#fafafa"
        }
        Rectangle{
            id:bottomPanel
            x: 0
            y: sizeHeigthConfig * (715-  massageArea.contentHeight)
            color:"white"
            z:5
            width: monitorWidth
            height: sizeHeigthConfig * ( 150 + massageArea.contentHeight)
            Rectangle{
                id:focusChanged
                width:sizeWidthConfig *  440
                height:sizeHeigthConfig * 2
                y: sizeHeigthConfig * (71 + massageArea.contentHeight)
                x: sizeWidthConfig * 20
                color:"#1976D2"
                z:1
                visible: false
            }
            Rectangle{
                width:sizeWidthConfig *  440
                height:sizeHeigthConfig * 50
                y: sizeHeigthConfig * (20 +  massageArea.contentHeight)
                x: sizeWidthConfig * 20
                color:"#fafafa"
                TextInput{
                    id:massageArea
                    z:6
                    x: sizeWidthConfig * 65
                    y: sizeHeigthConfig * 10
                    width: sizeWidthConfig *  320
                    height: sizeHeigthConfig * 40
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    font.family: "Roboto";
                    font.pointSize: sizeHeigthConfig * 14
                    onTextChanged:{
                        firstClick = "false"
                        //loaderWebSocketChat.setSource('qrc:/qml/websocket/GeneralWebSocket.qml')
                        //ChatWriting.receiveToggleState()
                    }
                    onFocusChanged: {
                        focusChanged.visible = true
                    }
                }

                /*Image {
                    id: imageLineMap
                    source: "qrc:/image/map/pimgpsh_fullsize_distr.png"
                    x:sizeWidthConfig *200
                    y:sizeHeigthConfig*-20
                }*/



               /* ///[6]! Button sfile ///
                MouseArea {
                    id:sfileButtonMouse
                    width: sizeWidthConfig *  30
                    height: sizeHeigthConfig * 32

                    x: sizeWidthConfig *20
                    y: sizeHeigthConfig * 8
                    // y:575
                    Image {
                        id:sfileButton
                        width: sizeWidthConfig *  30
                        height: sizeHeigthConfig * 30
                        z: 1
                        source: "qrc:/image/chat/Attach.svg"
                        visible: false
                    }
                    ColorOverlay {
                        id:sfileColor
                        anchors.fill: sfileButton
                        source: sfileButton
                        color: "#1976D2"
                    }
                    onClicked: {

                        sfileColor.color = "#727272"

                    }

                }*/

                ///[6]! Button Send ///
                Rectangle {
                    id:sendButtonMouse
                    width: sizeWidthConfig *  60
                    height: sizeHeigthConfig * 62
                    x: sizeWidthConfig *390
                    y: sizeHeigthConfig * (-5)
                    color: "transparent"
                    Image {
                        id:sendButton
                        x: sizeWidthConfig * 10
                        y: sizeHeigthConfig * 15
                        width: sizeWidthConfig *  30
                        height: sizeHeigthConfig * 30
                        z: 3
                        source: "qrc:/image/chat/path.svg"
                        visible: false
                    }
                    ColorOverlay {
                        anchors.fill: sendButton
                        source: sendButton
                        color: "#1976D2"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log (itsNewChat)
                            if (itsNewChat === "Yes"){
                            userMessageText = massageArea.text
                            loaderWebSocketChat.setSource('qrc:/qml/websocket/GeneralWebSocket.qml')
                            massageArea.clear()
                            }
                            if (itsNewChat === "No" ){
                                userMessageText = massageArea.text
                                loaderWebSocketChat.setSource('qrc:/qml/websocket/GeneralWebSocket.qml')
                                massageArea.clear()
                            }else if (criateDialog === "Yes" ){
                                whenISend = 0
                                userMessageText = massageArea.text
                                loaderWebSocketChat.setSource('qrc:/qml/websocket/GeneralWebSocket.qml')
                                massageArea.clear()
                            }
                        }
                    }
                }
            }
            /*Rectangle{
                color: "transparent"
                y:100
                width: 480
                height: 1000

                Loader{
                    source: "qrc:/qml/testqml/Test.qml"
                }
            }*/
        }

        DropShadow {
            anchors.fill: bottomPanel
            radius: 6.0
            opacity: 0.24
            color: "#000000"
            source: bottomPanel
        }
    }

    Component {
        id: highlight
        Rectangle {
            width: sizeWidthConfig *  view.cellWidth; height: view.cellHeight
            color: "lightsteelblue"; radius: 5
            x: sizeWidthConfig *view.currentItem.x
            y: sizeHeigthConfig *  view.currentItem.y
            Behavior on x { SpringAnimation { spring: 3; damping: 0.2 } }
            Behavior on y { SpringAnimation { spring: 3; damping: 0.2 } }
        }

    }

}
