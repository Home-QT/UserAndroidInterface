import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0




///friendItems////
Item {

    width: monitorWidth
    height: monitorHeigth
    Component.onCompleted: {
        howINotRead = 0
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

    function getContactListInYourPhone(){
    xmlModel.xml=backEnd.getContacts();
    }

    XmlListModel {
        id: xmlModel
        query: "/root/item"

        XmlRole { name: "name"; query: "name/string()" }
        XmlRole { name: "number"; query: "number/string()" }
    }

    Loader{
        id:dataSearckWebSocket
    }

    TextInput{
        id:searchTextContact
        width: sizeWidthConfig * 340
        height: sizeHeigthConfig * 40
        y:sizeHeigthConfig * 24
        x:sizeWidthConfig * 70
        z:4
        font.family: "Roboto";
        text:""
        clip:true
        color:"white"
        font.pixelSize:sizeHeigthConfig *  24
        visible: false
        onTextChanged: {
            if(searchTextContact.text.length <= 3){
                p1modelDialog.clear()
                peopleModel.clear()
                searchActive = ""
                dataSearckWebSocket.source  = ""
               dataSearckWebSocket.source = "qrc:/qml/websocket/GeneralWebSocket.qml"
            }else{
            if (indexCheckedInTabBar === 1){
                searchActive = "People"
                peopleModel.clear()
                searchUserInFriend = searchTextContact.text
                 dataSearckWebSocket.source  = ""
                dataSearckWebSocket.source = "qrc:/qml/websocket/GeneralWebSocket.qml"
            }
            if (indexCheckedInTabBar === 0){
                searchActive = "Dialog"
                p1modelDialog.clear()
                searchUserInFriend = searchTextContact.text
                 dataSearckWebSocket.source  = ""
                dataSearckWebSocket.source = "qrc:/qml/websocket/GeneralWebSocket.qml"

            }
            }
        }
    }



    Rectangle{
        id:rectangleSearchAll
        width:0
        height: 2
        y:sizeHeigthConfig * 60
        x: sizeWidthConfig * 70
        z:4
        color:"white"
        PropertyAnimation { id: animationRectangleSearchAll;
            target: rectangleSearchAll;
            property: "width";
            to:sizeWidthConfig *  340;
            duration: 500 }

    }

    Rectangle{
        z:4
        y:sizeWidthConfig * 25
        x:sizeWidthConfig * 430
        width: sizeWidthConfig * 50
        height: sizeHeigthConfig * 50
        color:"transparent"
        Image {
            id: searchAdd
            width: sizeWidthConfig * 25
            height:sizeHeigthConfig * 25
            source: "qrc:/image/friend/ic_search_white.svg"
            visible: false

            PropertyAnimation {
                id: animationSearch;
                target: searchAddColor;
                property: "opacity";
                from:1;
                to: 0;
                duration: 500
            }
        }

        ColorOverlay {
            id:searchAddColor
            anchors.fill: searchAdd
            source: searchAdd
            color: "white"
            opacity: 1
        }

        Image {
            id: microAdd
            sourceSize.width: sizeWidthConfig * 20
            sourceSize.height:sizeHeigthConfig *  25
            source: "qrc:/image/friend/ic_mic.svg"
            visible: false

            PropertyAnimation { id: animationMicro;
                target: microAddColor;
                property: "opacity";
                from:0;
                to: 1;
                duration: 500 }
        }

        ColorOverlay {
            id:microAddColor
            anchors.fill: microAdd
            source: microAdd
            color: "white"
            opacity: 0
        }
        MouseArea {
            anchors.fill: parent;
            onClicked:{
                if(visibleIcoSearch == 0){
                    animationRectangleSearchAll.running = true
                    animationSearch.running = true
                    animationMicro.running = true
                    searchTextContact.visible=true
                }
                visibleIcoSearch++
            }
        }
    }

    Loader{
        id:dialogWebSocket
        asynchronous: true
        //source:"qrc:/qml/websocket/WebSocket.qml"
    }

    Image {
        id: image
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  0
        width: sizeWidthConfig * 481
        height: sizeHeigthConfig * 70
        z: 3
        source: "qrc:/image/title/blue.png"
        smooth: true


    }
    ShaderEffectSource {
        sourceItem:image
        recursive:true
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
        id: recSlider
        y: sizeHeigthConfig *  125
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
                    width: sizeWidthConfig *  160;
                    height: sizeHeigthConfig * 2;
                }
            }
        }
    }




    id:friendItem

    Loader{
        id:massageIdTools
    }

    Rectangle{
        y: sizeHeigthConfig *  100
        height:sizeHeigthConfig *  50
        //z:5
        width: sizeWidthConfig * 480
        color:"#1976D2"
    }
    Loader{
        id:ceapOwer
    }

    ///[1]! TabBar ///
    Rectangle{
        id:lolbar
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  75
        width: sizeWidthConfig *  480
        height: sizeHeigthConfig * 600
        TabBar {
            id: bar
            currentIndex: indexCheckedInTabBar
            Repeater {
                model: ["ДИАЛОГИ", "КОНТАКТЫ", "ДОКУМЕНТЫ"]
                TabButton {
                    id: control
                    text: modelData
                    width:sizeWidthConfig * 156.5
                    height: sizeHeigthConfig * 70
                    y:sizeHeigthConfig*5
                    font.pixelSize: sizeHeigthConfig* 15
                    onClicked: {
                        indexCheckedInTabBar = bar.currentIndex
                        if (bar.currentIndex === 2 ){
                            sliderHorizontalTab.value = 1
                            ceapOwer.source = ""

                            ceapOwer.source = "qrc:/qml/websocket/GeneralWebSocket.qml"
                        }
                        if (bar.currentIndex === 0 ){
                            p1modelDialog.clear()
                            sliderHorizontalTab.value = 0
                            dialogListAndContactList = ""
                            ceapOwer.source = ""
                            rect.visible = true
                            ceapOwer.source = "qrc:/qml/websocket/GeneralWebSocket.qml"
                        }
                        if (bar.currentIndex === 1 ){
                            peopleModel.clear()
                            sliderHorizontalTab.value = 0.5
                            dialogListAndContactList = ""
                            ceapOwer.source = ""
                            rectContact.visible = true
                            ceapOwer.source = "qrc:/qml/websocket/GeneralWebSocket.qml"
                        }
                    }
                    contentItem:
                        Text {
                        z:2
                        text: control.text

                        opacity: enabled ? 1.0 : 0.3
                        color: control.checked ? "#ffffff" : "#fcf9f9"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: sizeHeigthConfig * 18

                    }


                    background: Rectangle {
                        z:0
                        y:sizeHeigthConfig * (-10)
                        width: sizeWidthConfig * 165
                        height: sizeHeigthConfig * 57
                        //opacity: enabled ? 1 : 0.3
                        color: "#1976D2"
                        //border.width: 1
                        //radius: 2
                    }
                }
            }
        }

        Loader{
            id:loadedDialogList
            source: "qrc:/qml/websocket/GeneralWebSocket.qml"

        }

        StackLayout{
            width: sizeWidthConfig *  parent.width
            currentIndex: bar.currentIndex

            /// DIALOG!!!!///
            Item {
                id: loadDialog
                Rectangle {
                    z:10
                    width:sizeWidthConfig *  150
                    height: sizeHeigthConfig * 150
                    id: root
                    color: "transparent"
                    visible: true
                    Rectangle {
                        id: rect
                        width: root.width / 2
                        height: root.height / 2
                        transformOrigin: Item.BottomRight
                        x:sizeWidthConfig * 165
                        y:sizeHeigthConfig * 300
                        color:"#1976D2"
                        opacity: 0.5
                        visible:true
                        transform: Scale {
                            id: transformScale
                            origin {
                                x: rect.width
                                y: rect.height
                            }
                        }

                        SequentialAnimation {
                            running: true
                            loops: Animation.Infinite

                            // Top right
                            ParallelAnimation {
                                NumberAnimation {
                                    target: transformScale; property: "xScale"; from: 1; to: -1; duration: 500; easing.type: Easing.OutQuint
                                }

                                SequentialAnimation {
                                    NumberAnimation {
                                        target: transformScale; property: "yScale"; from: 1; to: 1.4; duration: 250; easing.type: Easing.OutQuart
                                    }

                                    NumberAnimation {
                                        target: transformScale; property: "yScale"; from: 1.4; to: 1; duration: 250; easing.type: Easing.OutQuart
                                    }
                                }
                            }

                            // Bottom right
                            ParallelAnimation {
                                NumberAnimation {
                                    target: transformScale; property: "yScale"; from: 1; to: -1; duration: 500; easing.type: Easing.OutQuint
                                }

                                SequentialAnimation {
                                    NumberAnimation {
                                        target: transformScale; property: "xScale"; from: -1; to: -1.4; duration: 250; easing.type: Easing.OutQuart
                                    }

                                    NumberAnimation {
                                        target: transformScale; property: "xScale"; from: -1.4; to: -1; duration: 250; easing.type: Easing.OutQuart
                                    }
                                }
                            }

                            // Bottom left
                            ParallelAnimation {
                                NumberAnimation {
                                    target: transformScale; property: "xScale"; from: -1; to: 1; duration: 500; easing.type: Easing.OutQuint
                                }

                                SequentialAnimation {
                                    NumberAnimation {
                                        target: transformScale; property: "yScale"; from: -1; to: -1.4; duration: 250; easing.type: Easing.OutQuart
                                    }

                                    NumberAnimation {
                                        target: transformScale; property: "yScale"; from: -1.4; to: -1; duration: 250; easing.type: Easing.OutQuart
                                    }
                                }
                            }

                            // Top left
                            ParallelAnimation {
                                NumberAnimation {
                                    target: transformScale; property: "yScale"; from: -1; to: 1; duration: 500; easing.type: Easing.OutQuint
                                }

                                SequentialAnimation {
                                    NumberAnimation {
                                        target: transformScale; property: "xScale"; from: 1; to: 1.4; duration: 250; easing.type: Easing.OutQuart
                                    }

                                    NumberAnimation {
                                        target: transformScale; property: "xScale"; from: 1.4; to: 1; duration: 250; easing.type: Easing.OutQuart
                                    }
                                }
                            }
                        }
                    }
                }

                Item{
                    id:addSwipecontact
                    z:5
                    Rectangle{
                        id:blueRectangleLittleAdd
                        y:sizeHeigthConfig * 600
                        x:sizeWidthConfig * 380
                        z:5
                        width: sizeWidthConfig * 70
                        height: sizeHeigthConfig * 70
                        radius:9999
                        color:"#1976D2"
                        Image {
                            id: littleAddChat
                            z:6
                            x: sizeWidthConfig * 15
                            y: sizeHeigthConfig * 18
                            sourceSize.width: sizeWidthConfig * 41
                            sourceSize.height:  sizeHeigthConfig * 26
                            source: "qrc:/image/friend/Group 76.svg"
                            visible: false
                        }
                        ShaderEffectSource {
                            sourceItem:littleAddChat
                            recursive:true
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
                                greyBox.x == 0 ? greyBox.x = sizeWidthConfig * 480 : greyBox.x = 0
                                urlBilderForWebSocket = "qrc:/qml/grup/CreateGrupChat.qml"
                                swipeByChatConfig =  "qrc:/qml/grup/CreateGrupChat.qml"
                            }
                        }
                    }
                    DropShadow {
                        anchors.fill: blueRectangleLittleAdd
                        radius: 10.0
                        opacity: 0.32
                        z:4
                        y:sizeWidthConfig * 10
                        color: "#000000"
                        source: blueRectangleLittleAdd
                    }
                }

                Component {
                    id: delegateDialog
                    Rectangle{
                        width: sizeWidthConfig *  480; height: sizeHeigthConfig*87
                         color: "transparent"
                        Rectangle {
                            width: sizeWidthConfig *  480; height: sizeHeigthConfig *  87
                            color: bigNotReadBull ? "#E3F2FD":"transparent"//"#E3F2FD":"transparent"
                            border.color:"#EEEEEE"
                            border.width: 0.5
                            radius: 0.5
                            Rectangle{
                                x: sizeWidthConfig *10
                                y: sizeHeigthConfig * 10
                                z:4
                                color: "transparent"
                                Text{
                                    x: sizeWidthConfig * 355
                                    y: sizeWidthConfig * 7
                                    text: timeOfTheLastMessage
                                    color:"grey"
                                    horizontalAlignment :Text.AlignRight
                                    font.family: "Roboto";
                                    font.pixelSize: sizeHeigthConfig * 16
                                }
                                Image {
                                    id: imageNext
                                    x: sizeWidthConfig * 435
                                    y: sizeHeigthConfig * 9
                                    width: imageNext.implicitWidth
                                    height: imageNext.implicitHeight
                                    source: "qrc:/image/logo/Icon.png"
                                }
                                ShaderEffectSource {
                                    sourceItem:imageNext
                                    recursive:true
                                }

                                Text {
                                    z:5
                                    x: sizeWidthConfig *350
                                    y: sizeHeigthConfig * 7
                                    width: sizeWidthConfig *  480
                                    height: sizeHeigthConfig * 20
                                    visible: false
                                    property bool ignoreTextChange: false
                                    wrapMode: Text.WordWrap
                                    Layout.fillWidth: true
                                    text: ""+idUserDialog
                                    font.pixelSize: sizeHeigthConfig * 13
                                    font.family: "Roboto";
                                }
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
                                    text: ""+idFinedUser
                                    font.pixelSize:sizeHeigthConfig * 8
                                    font.family: "Roboto";
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
                                    id: avaDialog
                                    x: sizeWidthConfig * 0
                                    y: sizeHeigthConfig * 5
                                    z:4
                                    visible:false
                                    width: sizeWidthConfig * 55
                                    height: sizeHeigthConfig * 55
                                    source: scoreDialogAva
                                }
                                ShaderEffectSource {
                                    sourceItem:avaDialog
                                    recursive:true
                                }

                                OpacityMask {
                                    id: roundedPhoto
                                    z:5
                                    anchors.fill: background
                                    source: avaDialog
                                    maskSource: background
                                }


                                Rectangle{

                                    z: rectcolorit ? 3: 5
                                    color: "transparent"
                                    ///ava and nic ///
                                    Rectangle{
                                        id: circle_Rand_Dialog
                                        x: sizeWidthConfig * 0
                                        y: sizeHeigthConfig * 5
                                        z:2

                                        property int posX: 0
                                        property int posY: 0
                                        property int size: 55
                                        property string selectedColor: '#' + ((Math.random() * 0x1000000) | 0x1000000).toString(16).substr(1)
                                        width: sizeWidthConfig *  size
                                        height: sizeHeigthConfig * size
                                        radius: sizeHeigthConfig * size
                                        color: selectedColor
                                    }
                                    Text{
                                        id:textOnlineStatus
                                        z:2
                                        visible: true
                                        text:sUO
                                        font.family: "Roboto";
                                    }

                                    Text {
                                        id: typeOfChat
                                        text: type
                                        visible: false
                                        font.family: "Roboto";
                                    }


                                    Text {
                                        //id: searchBukva
                                        x: sizeWidthConfig *14.5
                                        y: sizeHeigthConfig * 8.5
                                        z:2
                                        text:dialogBukva
                                        font.pixelSize: sizeHeigthConfig *  36
                                        color: "white"
                                        font.family: "Roboto";
                                    }

                                    Item {
                                        id : triangle
                                        width: sizeWidthConfig *  30
                                        height: sizeHeigthConfig * 30
                                        clip : true
                                        z:1.5
                                        x: sizeWidthConfig *25
                                        y: sizeHeigthConfig * 5

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
                                            rotation : 50
                                            scale : 1.414
                                        }
                                    }
                                }

                                MouseArea{
                                    z:5
                                    width: sizeWidthConfig *  55
                                    height: sizeHeigthConfig * 100
                                    hoverEnabled: true
                                    onClicked: {
                                       /* dialogIdUser = idUserDialog
                                        bykvaNameInTheUserName = dialogBukva
                                        peopleStatusOnlireOrNotColor = sUO
                                        nameOfTheDialog =  nicNameDialog*/
                                        accountInfoBool = true
                                        //accountInfoAnimation = 0
                                         atherUserId = idFinedUser
                                        loaderAboutAther.source = ""
                                        loaderAboutAther.source = "qrc:/qml/accounts/Ather.qml"
                                    }
                                }
                                Rectangle{
                                    x: sizeWidthConfig *75
                                    y: sizeHeigthConfig * 30
                                    width: sizeWidthConfig *  355
                                    height: sizeHeigthConfig * 25
                                    z:5
                                    color: shortNotReadBull ? "#E3F2FD":"transparent"
                                Text {

                                    z:4
                                    width: sizeWidthConfig *  355
                                    height: sizeHeigthConfig * 20
                                    property bool ignoreTextChange: false
                                    wrapMode: Text.WordWrap
                                    Layout.fillWidth: true
                                    clip:true
                                    text: textBody
                                    color:"grey"
                                    font.family: "Roboto";
                                    font.pixelSize: sizeHeigthConfig * 16
                                }
                                }


                                Text {
                                    id:nicNameDialogText
                                    z:5
                                    x: sizeWidthConfig *75
                                    y: sizeHeigthConfig * 4
                                    width:  sizeWidthConfig *  260
                                    height: sizeHeigthConfig * 24
                                    property bool ignoreTextChange: false
                                    wrapMode: Text.WordWrap
                                    text: nicNameDialog
                                    clip:true
                                    font.family: "Roboto";
                                    font.pixelSize: sizeHeigthConfig *  20
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

                                    dialogIdUser = idUserDialog
                                    atherUserId = idFinedUser
                                    nameOfTheDialog =  nicNameDialog
                                    if (type === "0"){
                                        addOffset = 0
                                        addLimit = 9
                                        firstClick = "true"
                                        urlBilderForWebSocket = "qrc:/qml/chat/Chat.qml"
                                        swipeByChatConfig=""
                                        swipeByChatConfig = "qrc:/qml/chat/Chat.qml"

                                        timerSwipe.start()
                                    }
                                    else{
                                        addOffset = 0
                                        addLimit = 9
                                        firstClick = "true"
                                        urlBilderForWebSocket = "qrc:/qml/grup/grupChatStile.qml"
                                        swipeByChatConfig=""
                                        timerSwipe.start()
                                        swipeByChatConfig = "qrc:/qml/grup/grupChatStile.qml"
                                    }
                                }
                            }
                        }

                    }

                }
                Timer {
                    id:timerSwipe
                    interval: 150; running: false; repeat: true

                    onTriggered:{
                        greyBox.x == 0 ? greyBox.x = sizeWidthConfig * 480 : greyBox.x = 0
                        //greyBox.x == 0 ?opacityGrayBoxDown.start():opacityGrayBoxUP.start()
                        timerSwipe.stop()
                    }
                }
                TextArea {
                    id: p1input
                    visible: false
                    font.family: "Roboto";
                }

                ListView {
                    id: p1scoresDialog
                    model: p1modelDialog
                    z:0
                    y: sizeHeigthConfig * 53
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig *700
                    delegate: delegateDialog
                    clip:true
                    currentIndex:2
                    Component.onCompleted: {
                        p1modelDialog.clear()
                    }
                    onMovementStarted:{
                        addSwipecontact.visible = false
                    }
                     onMovementEnded:{
                        addSwipecontact.visible = true
                    }
                    ListModel {
                        id: p1modelDialog
                        ListElement {
                            sUO:'';
                            onlineUser:'';
                            idUserDialog:'';
                            idFinedUser:'';
                            nicNameDialog: '';
                            scoreDialogAva:'';
                            textBody:'';
                            dialogBukva:'';
                            rectcolorit:'';
                            type:'';
                            timeOfTheLastMessage:'';
                            bigNotReadBull:"";
                            shortNotReadBull:"";
                        }

                    }
                }
            }

            /// CONTACT !!!!///
            Item {
                id: loadContact
                Item{
                    id:addContact
                    z:5
                    Rectangle{
                        id:blueRectangleAdd
                        y:sizeHeigthConfig * 600
                        x:sizeWidthConfig * 380
                        z:5

                        width:sizeWidthConfig * 70
                        height:sizeHeigthConfig *70
                        radius:9999
                        color:"#1976D2"
                        Image {
                            id: addChat
                            z:6
                            x:sizeWidthConfig * 20
                            y:sizeHeigthConfig * 20
                            sourceSize.width: sizeWidthConfig * 26
                            sourceSize.height: sizeHeigthConfig * 26
                            source: "qrc:/image/chat/ic_add_white.svg"
                            visible: false
                        }

                        ShaderEffectSource {
                            sourceItem:addChat
                            recursive:true
                        }


                        ColorOverlay {
                            z:6
                            id:addedChat
                            anchors.fill: addChat
                            source: addChat
                            color: "white"
                            opacity: 1
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                // swipeUrl =  "qrc:/qml/grup/CreateGrupChat.qml"
                            }
                        }
                    }
                    DropShadow {
                        anchors.fill: blueRectangleAdd
                        radius: 10.0
                        opacity: 0.32
                        z:4
                        y:sizeHeigthConfig * 10
                        color: "#000000"
                        source: blueRectangleAdd
                    }
                }



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
                            Text {
                                z:5
                                x: sizeWidthConfig *320
                                y: sizeHeigthConfig * 45
                                width: sizeWidthConfig *  480
                                height: sizeHeigthConfig * 20
                                visible:  false
                                wrapMode: Text.WordWrap
                                text: ""+idFined
                                font.pixelSize:sizeHeigthConfig * 8
                                font.family: "Roboto";
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
                                    height: sizeHeigthConfig * 35
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
                                    accountInfoBool = true
                                    //accountInfoAnimation = 0
                                    atherUserId = idFined
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
                            hoverEnabled: true
                            onClicked: {
                                accountInfoBool = true
                                //accountInfoAnimation = 0
                                 atherUserId = idFined
                                loaderAboutAther.source = ""
                                loaderAboutAther.source = "qrc:/qml/accounts/Ather.qml"
                            }
                        }
                    }
                }
                TextArea {
                    id: peopleInput
                    visible: false
                }
                Rectangle{
                    y:sizeHeigthConfig * 60
                    color: "#95989A"
                    opacity: 0.24
                    width: sizeWidthConfig * 480
                    height: sizeHeigthConfig * 40
                    Text {
                        id: contactText
                        x:sizeWidthConfig*15
                        y:sizeHeigthConfig *5
                        color: "#000000"
                        text: "Контакты ("+peopleScores.count+")"
                        font.pixelSize: sizeHeigthConfig * 20
                    }

                }

                Rectangle{
                    y:sizeHeigthConfig * 60
                    x:sizeWidthConfig * 300
                    height: sizeHeigthConfig * 40
                    width: sizeWidthConfig * 50
                    color: "transparent"

                    Text {
                        id:  allContact
                        x:sizeWidthConfig*15
                        y:sizeHeigthConfig *5
                        text: qsTr("Все")
                        opacity: 0.5
                        color: "#1976D2"
                        font.family: "Roboto";
                        font.pixelSize: sizeHeigthConfig * 20
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            getContactListInYourPhone();
                            allcontactListView.visible = true
                            peopleScores.visible = false
                            allGUP.opacity = 0.5
                            allContact.opacity = 1
                             contactText.text = "Контакты ("+allcontactListView.count+")"
                        }
                    }
                }

                Rectangle{
                    y:sizeHeigthConfig * 60
                    x:sizeWidthConfig * 360
                    height: sizeHeigthConfig * 40
                    width: sizeWidthConfig * 50
                    color: "transparent"

                    Text {
                        id:  allGUP
                        x:sizeWidthConfig*15
                        y:sizeHeigthConfig *5
                        text: qsTr("GUP")
                        color: "#1976D2"
                        font.family: "Roboto";
                        font.pixelSize: sizeHeigthConfig * 20
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            allcontactListView.visible = false
                            peopleScores.visible = true
                             contactText.text = "Контакты ("+peopleScores.count+")"
                            allGUP.opacity = 1
                            allContact.opacity =  0.5
                        }
                    }
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

                Component {
                    id: allcontactDelegate

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
                                    x: sizeWidthConfig *17.5
                                    y: sizeHeigthConfig * 17.5
                                    z:2
                                    text:model.name.charAt(0)
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
                                    accountInfoBool = true
                                    //accountInfoAnimation = 0
                                     atherUserId = idFinedUser
                                    loaderAboutAther.source = ""
                                    loaderAboutAther.source = "qrc:/qml/accounts/Ather.qml"
                                }
                            }

                            Text {
                                x: sizeWidthConfig *85
                                y: sizeHeigthConfig * 35
                                z:5
                                width: sizeWidthConfig *  480
                                height: sizeHeigthConfig * 20
                                property bool ignoreTextChange: false
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                                text:  model.number
                                color:"grey"
                                font.pixelSize: sizeHeigthConfig * 18
                                font.family: "Roboto";
                            }


                            Text {
                                z:5
                                x: sizeWidthConfig *85
                                y: sizeHeigthConfig * 10
                                width: sizeWidthConfig *  480
                                height: sizeHeigthConfig * 20
                                property bool ignoreTextChange: false
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                                text: model.name
                                font.pixelSize: sizeHeigthConfig * 20
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


                ListView {
                    id:allcontactListView
                    y: sizeHeigthConfig * 113
                    width: sizeWidthConfig *  480
                    height: sizeHeigthConfig *670
                    boundsBehavior: Flickable.StopAtBounds
                    clip:true
                    model: xmlModel

                    delegate: allcontactDelegate
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
                            rectcolorit:''
                        }
                    }
                }
            }


            Item {
                id: dataDocument
                Label{
                    id: documentNextChapter
                    x: sizeWidthConfig *((monitorWidth - documentNextChapter.contentWidth)/2)
                    y: sizeHeigthConfig * 250
                    text: "Здесь будут ваши документы"
                    color: "#999999"
                    font.family: "Roboto";
                    font.pixelSize:  sizeHeigthConfig * 20
                }
            }
        }
    }
}
