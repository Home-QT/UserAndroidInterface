import QtQuick 2.0
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.2
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
        y: Qt.inputMethod.keyboardRectangle.height >0 ?Qt.inputMethod.keyboardRectangle.height -sizeHeigthConfig * 30 + sizeHeigthConfig * (10)   : sizeHeigthConfig * (10)
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
                addOffset = 0
                addLimit = 9
                massageArea.focus = false
                urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                friendUrl = ""
                friendUrl = "qrc:/qml/friend/Friend.qml"
                greyBox.x == 0 ? greyBox.x = sizeWidthConfig * 480 : greyBox.x = 0//view.currentIndex = 2
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
        y: Qt.inputMethod.keyboardRectangle.height >0 ?Qt.inputMethod.keyboardRectangle.height -sizeHeigthConfig * 30 : 0
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

   /* AnimatedImage  {
        id: wtriteMe
        width: sizeWidthConfig *  67
        height: sizeHeigthConfig * 48
        //x:60
        y: sizeHeigthConfig * 540
        source: "qrc:/image/accounts/writer.gif"
        visible: false
    }*/

    DropShadow {
        anchors.fill: image
        radius: 6.0
        opacity: 0.24
        color: "#000000"
        source: image
    }


    TextInput{
        id: textToken;
        //text: autor();
    }


    ///ava and nic ///

    Label{
        id:nameMyFriend
        z:3
        x: sizeWidthConfig *125
        y:Qt.inputMethod.keyboardRectangle.height >0 ?Qt.inputMethod.keyboardRectangle.height -sizeHeigthConfig * 30 + sizeHeigthConfig * 23: sizeHeigthConfig * 23
        width: sizeWidthConfig *  150
        height: sizeHeigthConfig * 70
        text:"Unknow"
        color:"white"
        //horizontalAlignment: Text.AlignHCenter
        font.pixelSize:sizeHeigthConfig * 22
        font.family: "Roboto";
    }


    Rectangle{
        width: sizeWidthConfig *  80
        height: sizeHeigthConfig * 80
        x:sizeWidthConfig *(-50)
        y:Qt.inputMethod.keyboardRectangle.height >0 ?Qt.inputMethod.keyboardRectangle.height -sizeHeigthConfig * 30 +sizeHeigthConfig * (-17)  : sizeHeigthConfig * (-17)
        color:"transparent"
        z:5

        Rectangle{
            id: circle_Rand
            x: sizeWidthConfig *100
            y: sizeHeigthConfig * 27.5
            z:4

            property int posX: 0
            property int posY: 0
            property int size: 50
            property string selectedColor: '#' + ((Math.random() * 0x1000000) | 0x1000000).toString(16).substr(1)
            width: sizeWidthConfig *  size
            height: sizeHeigthConfig * size
            radius: 9999
            color: selectedColor
        }

        Text {
            id: bukvaAlf
            x: sizeWidthConfig *112
            y: sizeHeigthConfig * 29.5
            z:4
            text:"U"
            font.pixelSize:sizeWidthConfig * 32
            color: "white"
            font.family: "Roboto";
        }
        Item {
            id : component
            width: sizeWidthConfig *  30
            height: sizeHeigthConfig * 30
            clip : true
            z:2.5
            x: sizeWidthConfig *119
            y: sizeHeigthConfig * 26

            // The index of corner for the triangle to be attached
            property int corner : 0;

            Rectangle {
                x :  component.width * ((2+1) % 4 < 2 ? 0 : 1) - width / 2
                y :  component.height * (0 % 4 < 2 ? 0 : 1) -  height / 2
                z:2
                id : statusOnline
                color : "#a7a7a7"
                antialiasing: true
                width :  Math.min(component.width, component.height)
                height :   width
                transformOrigin: Item.Center
                rotation : 45
                scale : 1.414
            }
        }
    }

    Rectangle {
        id: background
        x:sizeWidthConfig *(50)
        y:Qt.inputMethod.keyboardRectangle.height >0 ?Qt.inputMethod.keyboardRectangle.height -sizeHeigthConfig * 30 +sizeHeigthConfig * ( 10)  : sizeHeigthConfig * ( 10)
        width: sizeWidthConfig * 50
        height: sizeHeigthConfig * 50
        radius: sizeWidthConfig * 50/2
        z:5
    }
    Image {
        id: myAva
        x: sizeWidthConfig *100
        y: sizeHeigthConfig * 28
        visible: false
        width: sizeWidthConfig * 50
        height: sizeHeigthConfig * 50
        source: ''
        //layer.enabled: rounded
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        smooth: true
    }
    OpacityMask {
        id: roundedPhoto
        z:5
        anchors.fill: background
        source: myAva
        maskSource: background
        //visible: (roundedPhoto.status==Image.Ready)

    }
    MouseArea{
        x: background.x
        y: background.y
        width: sizeWidthConfig * 50
        height: sizeHeigthConfig * 50
        z:5
        hoverEnabled: true
        onClicked: {
            accountInfoBool = true
            //accountInfoAnimation = 0
            loaderAboutAther.source = ""
            loaderAboutAther.source = "qrc:/qml/accounts/Ather.qml"

        }
    }
    Rectangle{
        id:accountInfo
        width:monitorWidth
        height: monitorHeigth
        z:7
        visible: accountInfoBool

       /* OpacityAnimator on opacity{
                from: accountInfoAnimation;
                to: 1;
                duration: 5000
            }*/
        Loader{
            z:2
            id:loaderAboutAther

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
                x: itsMessage ? sizeWidthConfig * 5:(itsMeSend ? -5 :  5)
                spacing: 6

                //property alias color : lineWhoWrite.color



                Rectangle {
                    id:messageRectangle
                    width: ( Math.min( (score.implicitWidth +24),  (p1scores.width - 62 - messageRow.spacing)))
                    height: itsMessage?
                                (itsBulletin ?
                                     (bulletinRect.height)
                                   :  (score.implicitHeight+10+imageAutorBulletin.implicitHeight)
                                 )

                              : (score.implicitHeight+10)
                    color: itsMessage ? "white" : (itsMeSend ? "#1976D2" : "lightgrey")
                    radius: 17
                    z:1
                    y: itsMessage ? sizeHeigthConfig * (0):0

                    /* Item{
                        width: 400 + score.implicitWidth
                        height:  190 + score.implicitHeight
                        visible:  itsMessage ?  (itsBulletin ? "qrc:/image/title/blue.png":""):""*/
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
                                        //timer.start()
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
                        y:itsMeSend ? score.height-12: score.height-15
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
                        id: score
                        z:2

                        text:  itsMessage ?( itsBulletin ? "":("Пользователь " + "<b>"+UserName+"</b>"+ " " + itsTime)): (itsMeSend ? '<p>' + myTextScore + '</p>': '<p>' + elseTextScore + '</p>')
                        color: itsMessage ? "lightgrey" : (itsMeSend ? "white" : "black")
                        anchors.fill: parent
                        anchors.margins: 12
                        wrapMode:Label.Wrap
                        font.family: "Roboto";
                        font.pixelSize: itsMessage ? sizeHeigthConfig * 14 :sizeHeigthConfig * 19

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
                            font.family: "Roboto";
                            color:"white"
                            font.pointSize: 8
                        }
                    }
                    Timer{
                        id:time
                        interval: 500; repeat: true
                        onTriggered: {
                        messageRectangle.y == 0 ? messageRectangle.y = sizeWidthConfig * 10 : messageRectangle.y = 0
                            time1.start()
                            time.stop()
                        }
                    }
                    Timer{
                        id:time1
                        interval: 500; repeat: true
                        onTriggered: {
                        messageRectangle.y == 0 ? messageRectangle.y = sizeWidthConfig * 10 : messageRectangle.y = 0
                        time1.stop()
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            time.start()
                        }
                    }
                    Behavior on y {
                        NumberAnimation {
                            duration: 1000
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


    DropShadow {
        anchors.fill: ololololo
        radius: 6.0
        opacity: 0.66
        color: "#000000"
        source: ololololo
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
        y: Qt.inputMethod.keyboardRectangle.height >0 ?Qt.inputMethod.keyboardRectangle.height -sizeHeigthConfig * 30 +sizeHeigthConfig * (0) :sizeHeigthConfig * (-0)
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
                rectShadow.visible = true
            }
        }
        Menu {
            z:5
            width: sizeWidthConfig * 180
            height: sizeHeigthConfig * 60
            id: menu
            x: sizeWidthConfig * (-150)
            y: sizeHeigthConfig *  40



            MenuItem {
                width: sizeWidthConfig * 180
                height: sizeHeigthConfig *30
                Text{
                    // id: addfriend
                    x: sizeWidthConfig *10
                    text:"Удалить чат"
                    color:"black"
                    font.pixelSize:sizeHeigthConfig * 20
                    horizontalAlignment :Text.AlignHCenter
                    font.family: "Roboto";
                }
            }


            MenuItem {
                width: sizeWidthConfig * 180
                height: sizeHeigthConfig *30
                MouseArea {
                    id: calendar
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    hoverEnabled: true
                    Text{
                        x: sizeWidthConfig *10
                        // id: addfriend
                        text:"Календарь"
                        horizontalAlignment :Text.AlignHCenter
                        font.pixelSize:sizeHeigthConfig * 20
                        color:"black"
                        font.family: "Roboto";
                    }
                    onClicked: {
                        shadowCalendar.visible = true
                        recCalendar.visible = true
                        menu.close();
                    }
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

    Rectangle{
        id:ololololo
        width: sizeWidthConfig *  480
        height: sizeHeigthConfig *70
        radius: 4.0
        z: -1
        color:"white"
        Rectangle{
            id:rectBotom
            y: sizeHeigthConfig * 10
            x: sizeWidthConfig *10
            z:0
            width: sizeWidthConfig *  460
            height: sizeHeigthConfig *60
            radius: 4.0
            color:"#fafafa"
        }
    }


    Timer {
        id:timerflicable
        interval: 500; running: true; repeat: true
        onTriggered:{
            if (flickable.contentY>sizeHeigthConfig * 4 && flickable.contentY< sizeHeigthConfig* 400){
                flickableUp.start()
                flickableDown.stop()
                nameMyFriend.visible = false
                circle_Rand.visible = false
                bukvaAlf.visible = false
                component.visible = false
                background.visible = false
                roundedPhoto.visible = false

            }
            if (flickable.contentY=== sizeHeigthConfig * 800){
                flickableUp.stop()
                flickableDown.stop()
                nameMyFriend.visible = false
                circle_Rand.visible = false
                bukvaAlf.visible = false
                component.visible = false
                background.visible = false
                roundedPhoto.visible = false
            }
            if (flickable.contentY>sizeHeigthConfig * 400 && flickable.contentY< sizeHeigthConfig * 800){
                flickableDown.start()
                flickableUp.stop()
                nameMyFriend.visible = true
                circle_Rand.visible = true
                bukvaAlf.visible = true
                component.visible = true
                background.visible = true
                roundedPhoto.visible = true
            }
        }
    }

    PropertyAnimation {id:flickableUp; target: flickable; property: "contentY"; to:sizeHeigthConfig* 800;duration: 500}
    PropertyAnimation {id:flickableDown; target: flickable; property: "contentY"; to:0;duration: 500}






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
            y: Qt.inputMethod.keyboardRectangle.height >0 ?Qt.inputMethod.keyboardRectangle.height -sizeHeigthConfig * 30  + sizeHeigthConfig * 80 :sizeHeigthConfig * 80
            z:-1
            //clip:true
            x: sizeWidthConfig *14
            width: sizeWidthConfig *  456
            height: Qt.inputMethod.keyboardRectangle.height >0 ? - Qt.inputMethod.keyboardRectangle.height - sizeHeigthConfig * 30 + sizeHeigthConfig * 650   - massageArea.contentHeight : sizeHeigthConfig * 650   - massageArea.contentHeight
            delegate: delegate
            spacing: 3
            clip:true
            verticalLayoutDirection: ListView.BottomToTop
            onFlickEnded:{
                /*var limit = addLimit
                addLimit = limit + 9*/
                firstClick = ""
                addOffset = addOffset + 10
                loaderWebSocketChat.setSource("qrc:/qml/websocket/GeneralWebSocket.qml")
            }

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
            id:bottomPanel
            x: 0
            y: Qt.inputMethod.keyboardRectangle.height>0 ?sizeHeigthConfig * 735 - massageArea.contentHeight - sizeHeigthConfig * 45 : sizeHeigthConfig * 735 - massageArea.contentHeight
            color:"white"
            z:5
            width: monitorWidth
            height: sizeHeigthConfig * 120 + massageArea.contentHeight
            Rectangle{
                id:bluerect
                width: 1
                height:sizeHeigthConfig * 2
                y: sizeHeigthConfig * 46 + massageArea.contentHeight
                x: (monitorWidth - bluerect.width)  / 2
                color:"#1976D2"
                z:1
                PropertyAnimation { id: animation;
                    target: bluerect;
                    property: "width";
                    to: sizeWidthConfig * 440;
                    duration: 500 }
            }
            Rectangle{
                width:sizeWidthConfig *  440
                height:sizeHeigthConfig * 30 + massageArea.contentHeight
                y: sizeHeigthConfig * 15
                x: sizeWidthConfig * 20
                color:"#fafafa"
                TextInput{
                    id:massageArea
                    z:6
                    x: sizeWidthConfig * 20
                    y: sizeHeigthConfig * (-5)+ massageArea.contentHeight
                    width: sizeWidthConfig *  365
                    height: sizeHeigthConfig * 20
                    wrapMode: Text.Wrap
                    font.family: "Roboto";
                    font.pixelSize: sizeHeigthConfig * 24
                    inputMethodHints:Qt.ImhNoPredictiveText
                    text:  "Введите сообщение"
                    opacity: 0.38
                    onFocusChanged: {
                        animation.start()
                        massageArea.opacity = 1
                        massageArea.clear()
                    }
                    onTextChanged:{
                        firstClick = "false"
                        /*loaderWebSocketChat.setSource('qrc:/qml/websocket/GeneralWebSocket.qml')
                        ChatWriting.receiveToggleState()*/
                    }

                }

                /*Image {
                    id: imageLineMap
                    source: "qrc:/image/map/pimgpsh_fullsize_distr.png"
                    x:sizeWidthConfig *200
                    y:sizeHeigthConfig*-20
                }*/



                /*///[6]! Button sfile ///
                MouseArea {
                    id:sfileButtonMouse
                    width: sizeWidthConfig *  30
                    height: sizeHeigthConfig * 32

                    x: sizeWidthConfig *20
                    y: sizeHeigthConfig * 8
                    // y:575
                    Image {
                        id:sfileButton
                        sourceSize.width: sizeWidthConfig *  30
                        sourceSize.height: sizeHeigthConfig * 30
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
                    y: sizeHeigthConfig * (-27)+ massageArea.contentHeight
                    color: "transparent"
                    Image {
                        id:sendButton
                        x: sizeWidthConfig * 10
                        y: sizeHeigthConfig * 15
                        sourceSize.width: sizeWidthConfig *  30
                        sourceSize.height: sizeHeigthConfig * 30
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
                            if (massageArea.text !== "Введите сообщение"){
                            if (createTetChat === "Yes"){
                                firstClick = ""
                                createTetChat = "CreateTet"
                                userMessageText = massageArea.text
                                loaderWebSocketChat.setSource('qrc:/qml/websocket/GeneralWebSocket.qml')
                             }else{

                                userMessageText = massageArea.text
                                loaderWebSocketChat.setSource('qrc:/qml/websocket/GeneralWebSocket.qml')
                            }
                            massageArea.clear()
                            }
                        }
                    }
                }
            }
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
