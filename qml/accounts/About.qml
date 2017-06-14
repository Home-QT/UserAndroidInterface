import QtQuick 2.0
import QtWebSockets 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import 'qrc:/js/socketManager.js' as SocketManager

Item {
    id:aboutItem
    width: monitorWidth
    height: monitorHeigth
    Component.onCompleted: {
        getPeopleJSON()
    }
/*    Image {
        z:15
        id: asdasdasd
        source: "qrc:/image/sizeConfig/Пользователь уже в друзьях – 1.png"
        opacity: 0.5
    }
*/
    ///[2]! Scrool Menu acrivate ///
    Rectangle {
        id: scrMenue
        x: sizeWidthConfig *15
        y: sizeHeigthConfig * 22
        z:5
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
                accountInfoBool = false
                accountMyInfoBool = false
                urlBilderForWebSocket =  "qrc:/qml/friend/Friend.qml"
                friendUrl = ""
                friendUrl = "qrc:/qml/friend/Friend.qml"
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

    property string imageBackAvatar: ""
    function getPeopleJSON() {
        var request = new XMLHttpRequest()
        request.open('GET', profilUrl+myId, true);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    var result = JSON.parse(request.responseText)
                    avaIcoS = imgUrlF + result.profile.imgId+imgUrlS

                    fio.text =  result.profile.firstname + " " + result.profile.lastname
                    phoneReg.text = result.profile.mainPhoneNumber
                    aboutUserWorck.text = result.profile.contact.companyName
                    aboutPositionWorck.text = result.profile.contact.position
                    if(result.profile.email !== "")
                        postEmailSupport.text = result.profile.email
                    else
                        emailSupport.visible = false
                    if (result.profile.contact.contactPhones.length > 0){
                        for(var j = 0; j <result.profile.contact.contactPhones.length; j++ ){
                            phoneSupport.text =result.profile.contact.contactPhones[j]
                        }
                    }else{
                        supportPhoneNumberSupport.visible = false
                        osnAboutUser.y = -100
                        emailSupport.y = -100
                        flicableContent.contentHeight = -100
                        if (result.profile.contact.companyName === ""){
                            osnAboutUser.visible = false
                            emailSupport.y = -280

                        }else{



                        }
                    }
                } else {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send()
    }
    Flickable {
        id:flicableContent
        width: sizeWidthConfig * 480;
        height:sizeHeigthConfig *  900;
        contentHeight: sizeHeigthConfig * 1000;


        Rectangle{
            id: rectangle
            y:sizeHeigthConfig * 83
            width: sizeWidthConfig * 480
            height:sizeHeigthConfig *  700
            z:0
            Image {
                id:imageBackAvatarImage
                width: sizeWidthConfig * 481
                height: sizeHeigthConfig * 250
                source: imgUrlF+myImgId+imgUrlS
            }
            /*Rectangle {
                id: atherAvatar
                x: sizeWidthConfig * 0
                width: sizeWidthConfig * 481
                height: sizeHeigthConfig * 250
                smooth: true
                color:"#1976D2"
            }*/
            FastBlur {
                   anchors.fill: imageBackAvatarImage
                   source: imageBackAvatarImage
                   radius: 100
               }

            Rectangle {
                id: background
                y:sizeHeigthConfig *  20
                width: sizeWidthConfig *  120
                height:sizeHeigthConfig *  120
                z: 8
                x: sizeWidthConfig * 180
                radius: 25


            }
            Image {
                id:avaIco
                z:8
                y:sizeHeigthConfig *  20
                height:sizeHeigthConfig *  120
                width: sizeWidthConfig *  120
                x: sizeWidthConfig * 180
                visible: false
                source: avaIcoS
            }
            OpacityMask {
                id: roundedPhoto
                z:9
                anchors.fill: background
                source: avaIco
                maskSource: background
            }


            ///[9]ava ico ///
            Rectangle{
                id: circle_Rand
                x:sizeWidthConfig * 180
                y:sizeHeigthConfig * 20
                width: sizeWidthConfig * 120
                height: sizeHeigthConfig *  120
                z:5

                property int posX: 0
                property int posY: 0
                property int size: 45
                property string selectedColor: '#' + ((Math.random() * 0x1000000) | 0x1000000).toString(16).substr(1)
                color: selectedColor
                radius: 99999
            }

            Text {
                id: bukvaAlf
                x:sizeWidthConfig * 213
                y:sizeHeigthConfig * 33
                z:7
                text:bykvaNameInTheUserName
                font.pointSize: 43
                color: "white"
            }

            ///User Name
            Text{
                id:fio
                y: sizeHeigthConfig * 162
                x: sizeWidthConfig * 25
                width:sizeWidthConfig * 430
                height: 20
                color:"white"
                text:"Unknown"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: sizeHeigthConfig * 32
            }


            Rectangle{
                y:sizeWidthConfig * 220
                width:sizeWidthConfig * 480
                height: sizeHeigthConfig * 700
                color:"#F2F2F2"

                /// основной номер

                Rectangle{
                    id: phoneNumberOsn
                    z:1
                    x:sizeWidthConfig *30
                    y:sizeHeigthConfig * 60
                    width: sizeWidthConfig * 420
                    height: sizeHeigthConfig * 80
                    Image {
                        id: cooling
                        width: sizeWidthConfig*  30
                        height: sizeHeigthConfig * 30
                        z:1
                        x:sizeWidthConfig * 22.5
                        y:sizeHeigthConfig * 22.5
                        source: "qrc:/image/accounts/colling.png"
                    }
                    Rectangle{
                        id: circle_Rand_Dialog
                        x:sizeWidthConfig* 15
                        y:sizeHeigthConfig *  15
                        z:0
                        property int posX: 0
                        property int posY: 0
                        property int size: 45
                        property string selectedColor: "#DCEAF8"
                        width: sizeWidthConfig *  size
                        height: sizeHeigthConfig * size
                        radius: size/2
                        color: selectedColor
                    }
                    Label{
                        x:sizeWidthConfig* 90
                        y:sizeHeigthConfig *  10
                        text:"Основной телефон"
                        font.pixelSize: sizeHeigthConfig * 14
                    }
                    Label{
                        id:phoneReg
                        x:sizeWidthConfig* 90
                        y:sizeHeigthConfig * 40
                        text:""
                        font.pixelSize: sizeHeigthConfig * 14
                        color:"grey"
                    }

                    Rectangle{
                        width: sizeWidthConfig* 5
                        height: sizeHeigthConfig * 80
                        color:"#14850C"
                        x:sizeWidthConfig * 415

                    }
                }

                DropShadow {
                    z:0
                    anchors.fill: phoneNumberOsn
                    radius: 6.0
                    opacity: 0.66
                    color: "#000000"
                    source: phoneNumberOsn
                }
                /// дополнительный номер
                Item{
                    id:supportPhoneNumberSupport

                    Rectangle{
                        z:1
                        id: phoneNumberSupport
                        x:sizeWidthConfig *30
                        y:sizeHeigthConfig * 160
                        width: sizeWidthConfig * 420
                        height: sizeHeigthConfig * 80
                        Image {
                            id: coolingSupport
                            width: sizeWidthConfig * 30
                            height: sizeHeigthConfig * 30
                            z:1
                            x:sizeWidthConfig * 22.5
                            y:sizeHeigthConfig * 22.5
                            source: "qrc:/image/accounts/colling.png"
                        }
                        Rectangle{
                            id: circleSupport_Rand_Dialog
                            x:sizeWidthConfig *15
                            y:sizeHeigthConfig * 15
                            z:0
                            property int posX: 0
                            property int posY: 0
                            property int size: 45
                            property string selectedColor: "#DCEAF8"
                            width: sizeWidthConfig * size
                            height: sizeHeigthConfig * size
                            radius: sizeHeigthConfig * size/2
                            color: selectedColor
                        }
                        Label{
                            x:sizeWidthConfig *90
                            y:sizeHeigthConfig * 10
                            text:"Контактный телефон"
                            font.pixelSize: sizeHeigthConfig * 14
                        }
                        Label{
                            id:phoneSupport
                            x:sizeWidthConfig *90
                            y:sizeHeigthConfig * 40
                            text:""
                            font.pixelSize: sizeHeigthConfig * 14
                            color:"grey"
                        }

                        Rectangle{
                            width: sizeWidthConfig *5
                            height: sizeHeigthConfig * 80
                            color:"#14850C"
                            x:sizeWidthConfig *415

                        }
                    }
                     DropShadow {
                         z:0
                    anchors.fill: phoneNumberSupport
                    radius: 6.0
                    opacity: 0.66
                    color: "#000000"
                    source: phoneNumberSupport
                }
                }
                /// основная инфа
                Item{
                    id:osnAboutUser
                    Rectangle{
                        z:1
                        id: aboutUser
                        x:sizeWidthConfig *30
                        y:sizeHeigthConfig * 260
                        width: sizeWidthConfig *420
                        height: sizeHeigthConfig * 160
                        Image {
                            id: chemodenchik
                            width:sizeWidthConfig *  50
                            height: sizeHeigthConfig * 50
                            z:1
                            x:sizeWidthConfig *12.5
                            y:sizeHeigthConfig * 12
                            source: "qrc:/image/accounts/distr.png"
                        }
                        Rectangle{
                            id: chemodenchik_Rand_Dialog
                            x:sizeWidthConfig *15
                            y:sizeHeigthConfig * 15
                            z:0
                            property int posX: 0
                            property int posY: 0
                            property int size: 45
                            property string selectedColor: "#DCEAF8"
                            width: sizeHeigthConfig * size
                            height: sizeHeigthConfig * size
                            radius: sizeHeigthConfig *  size/2
                            color: selectedColor
                        }
                        Label{
                            x:sizeWidthConfig *90
                            y:sizeHeigthConfig * 10
                            text:"Место работы"
                            font.pixelSize: sizeHeigthConfig * 14
                        }
                        Label{
                            id:aboutUserWorck
                            x:sizeWidthConfig *90
                            y:sizeHeigthConfig * 40
                            text:""
                            font.pixelSize: sizeHeigthConfig * 14
                            color:"grey"
                        }

                        Label{
                            x:sizeWidthConfig *90
                            y:sizeHeigthConfig * 70
                            text:"Должность"
                            font.pixelSize: sizeHeigthConfig * 14
                        }
                        Label{
                            id:aboutPositionWorck
                            x:sizeWidthConfig *90
                            y:sizeHeigthConfig * 100
                            text:""
                            font.pixelSize: sizeHeigthConfig * 14
                            color:"grey"
                        }

                        Rectangle{
                            width: sizeWidthConfig * 5
                            height:sizeHeigthConfig *  160
                            color:"red"
                            x:sizeWidthConfig * 415

                        }
                    }
                     DropShadow {
                         z:0
                    anchors.fill: aboutUser
                    radius: 6.0
                    opacity: 0.66
                    color: "#000000"
                    source: aboutUser
                }
                }
            }
            Item{
                id:emailSupport
                Rectangle{
                    id: emailNumberSupport
                    x:sizeWidthConfig *30
                    y:sizeHeigthConfig * 660
                    width: sizeWidthConfig *420
                    height:sizeHeigthConfig *  80
                    Text {
                        id: coolingEmailSupport
                        width: sizeWidthConfig * 30
                        height: sizeHeigthConfig * 30
                        z:1
                        x:sizeWidthConfig * 20.5
                        y:sizeHeigthConfig * 11.5
                        text: "@"
                        color:"#1976D2"
                        font.bold: true
                        font.pixelSize: sizeHeigthConfig * 26
                    }
                    Rectangle{
                        id: circleEmail_Rand_Dialog
                        x:sizeWidthConfig * 15
                        y:sizeHeigthConfig * 15
                        z:0
                        property int posX: 0
                        property int posY: 0
                        property int size: 45
                        property string selectedColor: "#DCEAF8"
                        width:sizeWidthConfig *  size
                        height: sizeHeigthConfig *  size
                        radius: sizeHeigthConfig * size/2
                        color: selectedColor
                    }
                    Label{
                        x:sizeWidthConfig *90
                        y:sizeHeigthConfig * 10
                        text:"E-mail"
                        font.pixelSize: sizeHeigthConfig * 14
                    }
                    Label{
                        id:postEmailSupport
                        x:sizeWidthConfig * 90
                        y:sizeHeigthConfig * 40
                        text:""
                        font.pixelSize: sizeHeigthConfig * 14
                        color:"grey"
                    }

                    Rectangle{
                        width:sizeWidthConfig *  5
                        height:sizeHeigthConfig *  80
                        color:"#14850C"
                        x:sizeWidthConfig * 415

                    }
                }
                DropShadow {
                anchors.fill: emailSupport
                radius: 6.0
                opacity: 0.66
                color: "#000000"
                source: emailSupport
            }
            }
        }
    }
}
