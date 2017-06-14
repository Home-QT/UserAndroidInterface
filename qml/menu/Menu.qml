import QtQuick 2.7
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Item {
    id:menuItem
    width: monitorWidth
    height: monitorHeigth
    Component.onCompleted: {
    imageItem(currentMenueIndex)
    }


    Rectangle{
        id:accountInfo
        width:monitorWidth
        height: monitorHeigth
        z:4
        visible: accountMyInfoBool
        Loader{
            z:2
            id:loaderAboutMe

        }
    }

    Loader {
         id: chatGup
      }


    Loader{
        id:stGup
        source:stGupSource

    }
    Loader{
        id:socketLoader

    }



    function imageItem(indexWar){
        menueListModel.clear()
        var itemMenue = ["Сообщения","Уведомления","Контакты","Счета и покупки","Настройки",/*"Сервисы GUP",/*"История покупок","История продаж",*/"Мои объявления","Не жмакай!","Выход"]

        var menueImgActive = ["qrc:/image/menu/Unactive/path.png",
                              "qrc:/image/menu/Unactive/notifications-button.png",
                              "qrc:/image/menu/Unactive/phone-book.png",
                              "qrc:/image/menu/Unactive/dollar-symbol.png",
                              "qrc:/image/menu/Unactive/settings-work-tool.png",
                              //'',
                              /*'////////',
                              '////////',*/
                              "qrc:/image/menu/Unactive/store.png",
                              "qrc:/image/menu/Unactive/puzzle-piece-silhouette.png",
                              "qrc:/image/menu/Active/exit.png" ]
        var menueImgNotActive = ["qrc:/image/menu/Active/outbox.png",
                                 "qrc:/image/menu/Active/trash.png",
                                 "qrc:/image/menu/Active/spam.png",
                                 "qrc:/image/menu/Active/forums.png",
                                 "qrc:/image/menu/Active/updates.png",
                                 //"",
                                 //"",
                                 "qrc:/image/menu/Active/store.png",
                                 //"qrc:/image/menu/Active/promos.png",
                                 "qrc:/image/menu/Active/purchases.png",
                                 "qrc:/image/menu/Active/exit.png"]

        //menueList.currentIndex = index
        var revelor = "true"
        var itsVisibleSma = ""
        for(var i = 0; i < itemMenue.length; i++){
            /*if (i == 5)
                revelor = ""
            else
                revelor = "true"*/
            if ( i === 0 && howINotRead > 0)
                itsVisibleSma = "true"
            else
                itsVisibleSma = ""
            var currentIndex = indexWar
            menueImgNotActive[currentIndex] = menueImgActive[currentIndex]
            menueListModel.append({textColumn:itemMenue[i],imageMenueColumnSource:menueImgNotActive[i],colorTextMenue:revelor, smsVisible:itsVisibleSma})
        }
    }

    Rectangle {
        id: scrMenue
        x: sizeWidthConfig *15
        y: sizeHeigthConfig * 10
        z:0
        width: sizeWidthConfig *  50
        height: sizeHeigthConfig * 50
        color: scrMenue_mouse_area.pressed ? "#1976D2" : "#1976D2"
        radius: 99999
        border.width: 3
        border.color: "#1976D2"
        Component.onCompleted: {
            var someText  = myUserName
            var  firstChar = someText.substr(0, 1).toUpperCase();
            bukvaMyNic.text = firstChar
        }

        function getMyJSON() {
            var request = new XMLHttpRequest()
            request.open('GET', profilUrl+myId, true);
            request.onreadystatechange = function() {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status && request.status === 200) {
                        var result = JSON.parse(request.responseText)
                        myImgId = result.profile.imgId
                    } else {
                        console.log("HTTP:", request.status, request.statusText)
                    }
                }
            }
            request.send()
        }
        Text {
            id: scrMenue_label
            x: sizeWidthConfig *38
            y: sizeHeigthConfig *  18
            text: qsTr(" ≡ ")
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: sizeHeigthConfig * 50
        }
        MouseArea {
            id: scrMenue_mouse_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#1976D2"
            onExited: parent.border.color = "#1976D2"
            onClicked: {
                if  ( drawer.open() === true){
                    accountInfoBool = false
                    accountMyInfoBool = false
                    drawer.close()
                    visibleIcoSearch = 0
                }
                else{
                    drawer.open();
                    accountInfoBool = false
                    accountMyInfoBool = false
                    visibleIcoSearch = 0;
                }
                imageItem(currentMenueIndex)
                //drawer.open();

            }
        }
    }

    Loader{
        id: webSocketLoad

    }


    ///[4]! Scrool Menu ///
    Drawer {
        id: drawer
        width: sizeWidthConfig *  410
        height: sizeHeigthConfig * 900
        //y:85
        z:0
        Item {
            z:0
            anchors.left: parent.left
            anchors.right: parent.right
            height: sizeHeigthConfig *160
            //image bg ico//
            MouseArea {
                id: about_mouse_area
                anchors.fill: parent
                hoverEnabled: true
                Image {
                    id: background
                    width: sizeWidthConfig *  410
                    height: sizeHeigthConfig * 235
                    source:imgUrlF+myImgId+imgUrlS
                    fillMode: Image.PreserveAspectCrop
                }
               DropShadow {
                    anchors.fill: background
                    radius: 6.0
                    opacity: 0.66
                    color: "#000000"
                    source: background
                }
               FastBlur {
                      anchors.fill: background
                      source: background
                      radius: 100
                  }
                onClicked: {
                    atherUserId = myId
                    drawer.close()
                    accountMyInfoBool = true
                    loaderAboutMe.source =""
                    loaderAboutMe.source = "qrc:/qml/accounts/Ather.qml"
                }
            }

            Rectangle {
                    id: recAvatar
                    x: sizeWidthConfig *20
                    y: sizeHeigthConfig * 50
                    z:3
                    width: sizeWidthConfig *  100; height: recAvatar.width
                    radius:99999

                }

            // avatar image //

            Image {
                id:userAvatar
                property bool rounded: true
                property bool adapt: true
                x: sizeWidthConfig *15
                y: sizeHeigthConfig * 100
                z:3
                visible:false
                source: imgUrlF+myImgId+imgUrlS
                width: sizeWidthConfig *  100; height: userAvatar.width
            }


            OpacityMask {
                    id: roundedPhoto
                    z:5
                    anchors.fill: recAvatar
                    source: userAvatar
                    maskSource: recAvatar
                    //visible: (photoImage.status==Image.Ready)

                }




            ///ava and nic ///

            Rectangle{
                id: circle_Rand
                x: sizeWidthConfig *20
                y: sizeHeigthConfig * 50
                z:2
                property int posX: 0
                property int posY: 0
                property int size:sizeWidthConfig * 100
                property string selectedColor: '#' + ((Math.random() * 0x1000000) | 0x1000000).toString(16).substr(1)
                width: size
                height: size
                radius: 999999
                color: selectedColor
            }

            Text {
                id: bukvaMyNic
                x: sizeWidthConfig *37.5
                y: sizeHeigthConfig * 45
                z:2
                text:"U"
                font.pixelSize:sizeHeigthConfig *  42
                color: "white"
            }

            //userName//
            Label{
                id: userName
                x: sizeWidthConfig *20
                y: sizeHeigthConfig * 180
                text: myUserName ? myUserName:"Unknown"
                color: "white"
                font.pixelSize: sizeHeigthConfig * 20
            }
        }
      /* Image {
                        id: asdasd
                        source: "qrc:/image/sizeConfig/Сообщения – 1.png"
                        opacity: 0.30
                        z:80
                    }*/
        Item {
            id: menueComponentList
            Component {
                id: menueListDelegate

                Column {
                    Rectangle{
                        width: sizeWidthConfig * idTextColumn.width
                        height: sizeHeigthConfig * 50
                        color:"transparent"

                        Text{
                            id:idTextColumn
                            x:colorTextMenue ? sizeWidthConfig * 90:sizeWidthConfig * 15
                            text:textColumn
                            font.pixelSize: sizeHeigthConfig * 20
                            color:colorTextMenue ? "black" : "gray"
                        }

                        Image {
                            id: imageMenueColumn
                            x: sizeWidthConfig *20
                            width: sourceSize.width*sizeWidthConfig
                            height: sourceSize.height*sizeHeigthConfig
                            /*sourceSize.width: sizeWidthConfig *  30
                            sourceSize.height: sizeHeigthConfig * 30*/
                            source: imageMenueColumnSource
                        }

                        Rectangle{
                            id:messageCalculator
                            width: smsCalculator.contentWidth + sizeWidthConfig * 15
                            height: smsCalculator.height + sizeHeigthConfig * 5
                            x: sizeWidthConfig * 300
                            //y: sizeHeigthConfig * (-5)
                            color: "#ECEFF1"
                            radius: smsCalculator.height / 3
                            visible:smsVisible
                            border.color: "#CFD8DC"
                            border.width: 0.5
                            Text {
                                x:(messageCalculator.width - smsCalculator.contentWidth)/2
                                id: smsCalculator
                                text: howINotRead
                                color: "#42A5F5"
                                font.pixelSize: sizeHeigthConfig * 20
                            }

                        }

                        MouseArea{
                            width: sizeWidthConfig *  drawer.width
                            height: sizeHeigthConfig * 50
                            hoverEnabled: true
                            onClicked: {
                               var sourceLoader = [
                                   "qrc:/qml/friend/Friend.qml",
                                   'qrc:/qml/notice/Notice.qml',
                                   "qrc:/qml/friend/Friend.qml",
                                   "qrc:/qml/banking/balance.qml",
                                   'qrc:/qml/settings/SettingMenue.qml',
                                   /*'',
                                   /*'qrc:/qml/transaction/historyMyTransaction.qml',
                                   'qrc:/qml/transaction/historyMyTransaction.qml',*/
                                   /*"qrc:/qml/camera/Camera.qml",*/
                                   "qrc:/qml/announcementsMy/Announcements.qml",
                                   "qrc:/qml/testqml/Test.qml",
                                   "qrc:/qml/authorization/enter/Enter.qml"
                               ]
                                if (menueList.currentIndex = index === 8){
                                    tokenUSL = ""
                                    var http = new XMLHttpRequest()
                                    var url = "http://gup.com.ua:8183/api/oauth/logout";

                                    http.open("GET", url);

                                    http.setRequestHeader("Content-type", "application/json");
                                    http.onreadystatechange = function() {
                                        if(http.readyState == 4 && http.status == 200) {
                                            print("ok");
                                            tokenUSL = ""
                                            friendUrl = ""
                                            menueUrl = ""
                                            exitMode = 1
                                            textArea.text = ""
                                            //redBox.x == 0 ? redBox.x = sizeWidthConfig * 480 : redBox.x = 0
                                        }else{
                                                    print("cannot connect");
                                            }
                                    }
                                    http.send();
                                }
                                if (menueList.currentIndex = index=== 0){
                                    indexCheckedInTabBar = 0
                                     urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                                    friendUrl = ""
                                    friendUrl =  "qrc:/qml/friend/Friend.qml"
                                    socketLoader = "qrc:/qml/websocket/GeneralWebSocket.qml"


                                }
                                if (menueList.currentIndex = index === 2){
                                    indexCheckedInTabBar = 1
                                     urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                                    friendUrl = ""
                                    friendUrl =  "qrc:/qml/friend/Friend.qml"
                                    socketLoader = "qrc:/qml/websocket/GeneralWebSocket.qml"

                                 }
                                if ((menueList.currentIndex = index !== 0) && (menueList.currentIndex = index  !== 2))
                                    stGupSource =""
                                           friendUrl= sourceLoader[menueList.currentIndex = index]
                                drawer.close();
                                //stGup.source = "qrc:/qml/authorization/enter/Enter.qml"
                                currentMenueIndex = menueList.currentIndex = index


                            }
                        }

                    }

                }
            }
            ListView {
                id: menueList
                model: menueListModel
                x: sizeWidthConfig * 5
                y: sizeHeigthConfig * 265
                z:0
                clip:true
                width: sizeWidthConfig *  430
                height: sizeHeigthConfig * 559
                delegate: menueListDelegate
                spacing: 12
                ListModel {
                    id: menueListModel
                    ListElement { textColumn:'';imageMenueColumnSource:'';colorTextMenue:''; smsVisible:""}
                }
            }
        }
    }
}
