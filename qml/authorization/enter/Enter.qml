import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.0
import QtQuick.Window 2.2



Item {
    id: enterItem
    width: monitorWidth
    height: monitorHeigth
    Rectangle{
        width: monitorWidth
        height: monitorHeigth

        MouseArea{
            anchors.fill: parent
            onClicked:{
                field1.focus = false
                field2.focus = false
                Qt.inputMethod.keyboardRectangle.visible = false
            }
        }


        ///[4] Up ///
        Image {
            id: image
            x: sizeWidthConfig *0
            y: sizeHeigthConfig *  0
            width: sizeWidthConfig * 481
            height: sizeHeigthConfig * 92
            z: -3
            source: "qrc:/image/title/blue.png"
            smooth: true
        }

        Loader{
            id:socketReload
        }


        Timer {
            id:timerSwipe
            interval: 500; running: false; repeat: true

            onTriggered:{
                //view.currentIndex = 2
                timerSwipe.stop()
            }
        }

        Component.onCompleted: timerTocken.start()
        Timer {
            id:timer
            interval: 500; running: false; repeat: true

            onTriggered:{
                tokenUSL = textArea.text
                if(tokenUSL !== ""){

                    //redBox.x == 0 ?opacityRedBoxDown.start():opacityRedBoxUP.start()
                    //redBox.x == 200 ?opacityBlueBoxDown.start():opacityBlueBoxUP.start()
                    socketReload.source = webLinck
                    friendUrl = "qrc:/qml/friend/Friend.qml"
                    menueUrl =  "qrc:/qml/menu/Menu.qml"
                    urlBilderForWebSocket = "qrc:/qml/friend/Friend.qml"
                    redBox.x == 0 ? redBox.x = 200 : redBox.x = 0
                    if (friendLoader.progress === 1)
                        timerSwipe.start()
                    timer.stop()
                }else{
                    qmlSignal()
                }
            }
        }
        Timer {
            id:timerTocken
            interval: 100; running: false; repeat: true

            onTriggered:{
                if(tokenUSL !== ""){
                    socketReload.source = webLinck
                    friendUrl = "qrc:/qml/friend/Friend.qml"
                    menueUrl =  "qrc:/qml/menu/Menu.qml"
                    urlBilderForWebSocket = "qrc:/qml/friend/Friend.qml"
                    if (friendLoader.progress === 1)
                        timerSwipe.start()
                    timerTocken.stop()
                }
            }
        }


        Rectangle{
            id:whiteProperty
            width:sizeWidthConfig * 480
            height:sizeHeigthConfig * 800
            color:"white"
            z:1
            visible: false
            opacity: 0

            OpacityAnimator on opacity{
                id:animationRectEnter
                from: boolAnimationStarted;
                to: 0.5;
                duration: 500
            }

        }


        Rectangle {
            z:10
            width:sizeWidthConfig *  150
            height: sizeHeigthConfig * 150
            id: root
            color: "transparent"
            visible: false
            Rectangle {
                id: rect

                width: root.width / 2
                height: root.height / 2
                transformOrigin: Item.BottomRight
                x:sizeWidthConfig * 165
                y:sizeHeigthConfig * 300
                color:"#1976D2"
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
        DropShadow {
            anchors.fill: image
            radius: 6.0
            opacity: 16
            color: "#000000"
            source: image
        }
        Rectangle{
            id:shadowError
            visible: false
            width: monitorWidth
            height: monitorHeigth
            color: "#000000"
            z:7
            opacity: 0.5
        }
        Item {
            visible: false
            id:errorItems
            x:sizeWidthConfig * 40
            y:sizeHeigthConfig * 185
            z:8
            Rectangle{
                id:rectangleErrorMessage
                height:sizeHeigthConfig * 360
                width: sizeWidthConfig * 400
                z:1
                Text {
                    id: errorTitul
                    y:sizeHeigthConfig * 15
                    x:sizeWidthConfig * 35
                    text: qsTr("Ошибка авторизации")
                    font.pixelSize: sizeHeigthConfig * 30
                    color: "#1976D2"
                    font.family: "Roboto";
                }
                Text {
                    id:textErrorMessage
                    width: sizeWidthConfig * 340
                    x:sizeWidthConfig * 30
                    wrapMode: Label.WordWrap
                    font.pixelSize: sizeHeigthConfig * 26
                    y:sizeHeigthConfig * 100
                    font.family: "Roboto";
                }
                Rectangle{
                    width: rectangleErrorMessage.width
                    height: sizeHeigthConfig *2
                    y:sizeHeigthConfig * 75
                    color: "#1976D2"
                }
                Rectangle{
                    width: rectangleErrorMessage.width
                    height: sizeHeigthConfig *1
                    y:sizeHeigthConfig * 300
                    color: "grey"
                    opacity: 0.5
                }
                Rectangle{
                    width: rectangleErrorMessage.width
                    height: sizeHeigthConfig *60
                    y:sizeHeigthConfig * 302
                    color: "white"
                    z:2
                    Text {
                        text: qsTr("OK")
                        color:"#1976D2"
                        font.pixelSize: sizeHeigthConfig * 26
                        x:sizeWidthConfig * 170
                        y:sizeHeigthConfig * 15
                        font.family: "Roboto";
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            shadowError.visible = false
                            errorItems.visible = false
                        }

                    }
                }
            }
            DropShadow {
                anchors.fill: rectangleErrorMessage
                radius: 6.0
                opacity: 0.66
                color: "#000000"
                z:0
                source: rectangleErrorMessage
            }
        }


        Item {
            id: itemGupAutor
            visible:  itemGupAutorVisible

            TextArea {
                id: textArea
                x: sizeWidthConfig * 114
                y: sizeHeigthConfig * 362
                visible: false
                objectName: "textArea"
                wrapMode: TextArea.Wrap
                width: sizeWidthConfig *  sizeWidthConfig * 250
                height: sizeHeigthConfig * 20
                font.family: "Roboto";
            }


            Timer {
                id:timerLoader
                interval: 500; repeat: true
                onTriggered: {
                    timeIntervat = timeIntervat + timerLoader.interval

                    if (timeIntervat === 5000){
                        timerLoader.stop()
                        timeIntervat = 0
                        whiteProperty.visible=false
                        root.visible = false
                        //name.visible  = false
                        timer.stop()

                        var http = new XMLHttpRequest()
                        var url = "http://gup.com.ua:33333";
                        http.open("GET", url);
                        //Send the proper header information along with the request
                        http.onreadystatechange = function() {
                            if(http.readyState == 4 && http.status == 200) {
                                field1.color = "#FF3920"
                                field2.color = "#FF3920"
                            }else{
                                console.log(http.status)
                                /*if (http.status === 0){
                                textErrorMessage.text = "Работа портала приостановлена, ведутся технические работы. Приносим свои извинения."
                            }else{*/
                                textErrorMessage.text = "Не удалось войти из-за проблем с интернет - соединением. Проверьте подключение к сети и повторите попытку."
                                shadowError.visible = true
                                errorItems.visible = true
                            }
                        }
                        http.send();
                    }
                }
            }


            Rectangle{
                y:sizeHeigthConfig * 120
                width:monitorWidth
                height: monitorHeigth
                color : "transparent"

                Rectangle {
                    id: button_enter
                    color: button_enter_mouse_area.pressed ? "#1976D2" : "#1976D2"
                    x: sizeWidthConfig * 40
                    y: sizeHeigthConfig * 445
                    radius: 7
                    width: sizeWidthConfig * 400
                    height: sizeHeigthConfig * 55
                    anchors.topMargin: 396
                    border.width: 3
                    border.color: "#1976D2"

                    Text {
                        id: button_enter_label
                        x: sizeWidthConfig *38
                        y: sizeHeigthConfig *  18
                        text: qsTr("ВХОД")
                        color: "white"
                        font.family: "Roboto";
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: sizeHeigthConfig * 27
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
                            field1.focus = false
                            field2.focus = false
                            timer.start()
                            timerLoader.start()
                            qmlSignal()
                            whiteProperty.visible=true
                            root.visible=true
                            animationRectEnter.start()
                            boolAnimationStarted = 0
                            //name.visible  = true
                            exitMode = 0
                        }
                    }
                }

                TextInput {
                    id: field1
                    x:sizeWidthConfig *  40
                    y:Qt.inputMethod.keyboardRectangle.height >0 ? sizeHeigthConfig * 225 : sizeHeigthConfig * 275
                    width: sizeWidthConfig  * 400
                    height:sizeHeigthConfig * 40
                    antialiasing: false
                    renderType: Text.QtRendering
                    objectName: "field1"
                    clip:true
                    font.family: "Roboto";
                    text: "qqqq@qq.qq"
                    //placeholderText: "Введите Email"
                    inputMethodHints:Qt.ImhEmailCharactersOnly
                    font.pixelSize: sizeHeigthConfig*18
                }

                Rectangle{
                    x:sizeWidthConfig * 40
                    y:Qt.inputMethod.keyboardRectangle.height >0 ? sizeHeigthConfig *  250 : sizeHeigthConfig *  300
                    height: 2
                    width: sizeWidthConfig * 400
                    color: "#BDBDBD"
                }

                Image {
                    x:sizeWidthConfig * 420
                    y:sizeHeigthConfig * 318
                    id: icoPassword
                    z:5
                    //source: socketStatusActive

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if (socketStatusActive === "qrc:/image/accounts/visibleTrue.svg" ){
                                socketStatusActive = "qrc:/image/accounts/visibleFalse.svg"
                                field2.echoMode = TextInput.Normal
                            }else{
                                socketStatusActive = "qrc:/image/accounts/visibleTrue.svg"
                                field2.echoMode = TextInput.Password
                            }
                        }
                    }
                }

                ColorOverlay {
                    id:searchAddColor
                    anchors.fill: icoPassword
                    source: icoPassword
                    color: "#95989A"
                    opacity: 1
                    z:5
                }
                TextInput {
                    id: field2
                    x:sizeWidthConfig *  40
                    clip:true
                    y: Qt.inputMethod.keyboardRectangle.height >0 ? sizeHeigthConfig * 302:sizeHeigthConfig * 352
                    width: sizeWidthConfig * 400
                    height: sizeHeigthConfig * 40
                    renderType: Text.QtRendering
                    echoMode: TextInput.Password
                    objectName: "field2"
                    text: "1Q1Q1Q"
                    font.family: "Roboto";
                    //placeholderText: "Введите пароль"
                    inputMethodHints: Qt.ImhHiddenText
                    font.pixelSize: sizeHeigthConfig*18
                    onTextChanged:{
                        tokenUSL = ""
                        stGupSource =""
                        tokenUSL = ""
                        myId = ""

                    }
                }
                Rectangle{
                    x:sizeWidthConfig * 40
                    y:Qt.inputMethod.keyboardRectangle.height >0 ?sizeHeigthConfig * 322 : sizeHeigthConfig * 377
                    height: 2
                    width: sizeWidthConfig * 400
                    color: "#BDBDBD"

                }
            }
            Text {
                x: sizeWidthConfig * 115
                y: sizeHeigthConfig *277
                text: ""
                font.family: "Roboto";
                font.pixelSize: textArea.font.pixelSize

            }
        }

        Rectangle{
            x: sizeWidthConfig * 184
            y: sizeHeigthConfig //* (-20)
            width:sizeWidthConfig * 110
            height: sizeHeigthConfig * 110
            color:"#1976D2"
            radius: 9000

            Image {
                id: image1
                z:1
                x: sizeWidthConfig * (5)
                y: sizeHeigthConfig * (5)
                width: sizeWidthConfig * 100
                height: sizeHeigthConfig * 100
                source: "qrc:/image/logo/rendition.png"
                smooth: true
            }
            DropShadow {
                anchors.fill: image1
                opacity: 0.16
                color: "#000000"
                source: image1
            }
        }




        ///[2]Lable text of logo ///
        Label {
            id: label
            x: sizeWidthConfig * 60
            y: sizeHeigthConfig * 150
            text: qsTr("Добро пожаловать в GUP")
            font.pixelSize: sizeHeigthConfig * 28
            font.family: "Roboto";
        }
        Label {
            id: label1
            x: sizeWidthConfig *  128
            y: sizeHeigthConfig * 246
            text: qsTr("Впервые здесь?")
            font.pixelSize: sizeHeigthConfig* 15
            z: 3
            visible: Qt.inputMethod.keyboardRectangle.height === 0
            height: sizeHeigthConfig * 16
            font.family: "Roboto";
            color: "#999999"
        }



        ///[5] регистрация ///
        Loader { id: regLoader }

        Rectangle {
            id: button_reg
            x: sizeWidthConfig * 253
            y: sizeHeigthConfig * 249
            z:3
            visible: Qt.inputMethod.keyboardRectangle.height  === 0
            width: sizeWidthConfig * 69
            height: sizeHeigthConfig * 14
            radius: 7
            color: "transparent"
            border.width: 3
            border.color: "transparent"

            Text {
                id: button_reg_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  18
                text: qsTr("Регистрация")
                font.family: "Roboto";
                anchors.verticalCenterOffset: -2
                anchors.horizontalCenterOffset: 8
                z: 1
                color: "#1976D2"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: sizeHeigthConfig* 15
            }
            MouseArea {
                id: button_reg_mouse_area
                anchors.topMargin: -12
                anchors.bottomMargin: -8
                anchors.right: parent.right
                anchors.rightMargin: -25
                anchors.left: parent.left
                anchors.leftMargin: -9
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                hoverEnabled: true
                onEntered: parent.border.color = "white"
                onExited: parent.border.color = "white"
                onClicked: {
                    //itemGupAutorVisible = false
                    registrationURL = "qrc:/qml/authorization/registration/Registration.qml"
                }
            }
        }
        Label {
            id: re
            x: sizeWidthConfig *  128
            y: Qt.inputMethod.keyboardRectangle.height >0 ?  sizeHeigthConfig * 246 : sizeHeigthConfig * 306
            text: qsTr("Забыли пароль?")
            font.pixelSize: sizeHeigthConfig* 15
            z: 3
            height: sizeHeigthConfig * 16
            color: "#999999"
            font.family: "Roboto";
        }


        Rectangle {
            id: button_re
            x: sizeWidthConfig * 263
            y: Qt.inputMethod.keyboardRectangle.height >0 ? sizeHeigthConfig * 249  : sizeHeigthConfig * 309
            z:3
            width: sizeWidthConfig * 69
            height: sizeHeigthConfig * 14
            radius: 7
            color: "transparent"
            border.width: 3
            border.color: "transparent"

            Text {
                id: button_re_label
                x: sizeWidthConfig *38
                y: sizeHeigthConfig *  18
                text: qsTr("Восстановить")
                anchors.verticalCenterOffset: -2
                anchors.horizontalCenterOffset: 8
                z: 1
                color: "#1976D2"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: sizeHeigthConfig* 15
                font.family: "Roboto";
            }
            MouseArea {
                id: button_re_mouse_area
                anchors.topMargin: -12
                anchors.bottomMargin: -8
                anchors.right: parent.right
                anchors.rightMargin: -25
                anchors.left: parent.left
                anchors.leftMargin: -9
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                hoverEnabled: true
                onEntered: parent.border.color = "white"
                onExited: parent.border.color = "white"
                onClicked: {

                }
            }
        }


        Rectangle{
            id : beckRec
            x: sizeWidthConfig * 38
            y: sizeHeigthConfig * 224
            width:sizeWidthConfig * 400
            height:sizeHeigthConfig* 58
            color: "transparent"
            border.color: "#1976D2"
            border.width: 1
            radius: 5
            z:1
        }

        DropShadow {
            anchors.fill: beckRec
            radius: 6.0
            opacity: 0.66

            color: "#000000"
            source: beckRec
        }


        ///[3] All Button ///
        Rectangle{
            y:sizeHeigthConfig * 50
            width: sizeWidthConfig
            height: sizeHeigthConfig
            //enter//
            Loader {
                id: loaderEnter
                OpacityAnimator on opacity{
                    from: boolAnimationStarted;
                    to: 1;
                    duration: 200
                }
            }

            //google+//
            Image {
                id: google
                x: sizeWidthConfig * 55
                y: sizeHeigthConfig * 595
                width: sizeWidthConfig * 55
                height:sizeHeigthConfig *  55
                z: 1
                source: "qrc:/image/logo/gm.png"
            }
            Rectangle {
                id: button_google
                x: sizeWidthConfig *  40
                y: sizeHeigthConfig * 595
                width: sizeWidthConfig * 400
                height:sizeHeigthConfig *  55
                color: button_google_mouse_area.pressed ? "#FF3920" : "#FF3920"
                radius: 7
                border.width: 3
                border.color: "#FF3920"

                Text {
                    id: button_google_label
                    x: sizeWidthConfig *38
                    y: sizeHeigthConfig *  18
                    text: qsTr("GOOGLE +")
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize:sizeHeigthConfig *  27
                    font.family: "Roboto";
                }
                MouseArea {
                    id: button_google_mouse_area
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.border.color = "#FF3920"
                    onExited: parent.border.color = "#FF3920"
                    onClicked: {
                        /*timer.start()
                        timerLoader.start()
                        qmlSignal()
                        whiteProperty.visible=true
                        root.visible=true
                        animationRectEnter.start()
                        boolAnimationStarted = 0
                        //name.visible  = true
                        exitMode = 0*/
                    }
                }
            }

            Image {
                id: fb
                x: sizeWidthConfig * 55
                y: sizeHeigthConfig * 675
                width:sizeWidthConfig *  55
                height:sizeHeigthConfig * 55
                z: 1
                source: "qrc:/image/logo/fb.png"
            }
            Rectangle {
                id: button_facebook
                x: sizeWidthConfig * 40
                y: sizeHeigthConfig * 675
                width: sizeWidthConfig * 400
                height: sizeHeigthConfig * 55
                color: button_facebook_mouse_area.pressed ? "#3b5998" : "#3b5998"
                radius: 7
                border.width: 3
                border.color: "#3b5998"

                Text {
                    id: button_facebook_label
                    x: sizeWidthConfig *38
                    y: sizeHeigthConfig *  18
                    text: qsTr("FACEBOOK")
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize:sizeHeigthConfig *  27
                    font.family: "Roboto";
                }
                MouseArea {
                    id: button_facebook_mouse_area
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.border.color = "#3b5998"
                    onExited: parent.border.color = "#3b5998"
                    onClicked: {

                        /* timer.start()
                    timerLoader.start()
                    qmlSignal()
                    whiteProperty.visible=true
                    root.visible=true
                    animationRectEnter.start()
                    boolAnimationStarted = 0
                    //name.visible  = true
                    exitMode = 0*/
                    }
                }

            }
        }
    }

}
