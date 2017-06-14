import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebSockets 1.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id:mainItem
    visible: true
    title: qsTr("GUP")
    property int monitorWidth: Screen.width
    property int monitorHeigth: Screen.height

    property double sizeHeigthWithTopPanel:(monitorHeigth)/ 800


    property double sizeWidthConfig: monitorWidth / 480
    property double sizeHeigthConfig: monitorHeigth/ (830)

    width: monitorWidth
    height: monitorHeigth
    signal qmlSignal()
    signal contactSignal()
    signal qmlSignalCreateTransaction()
    signal getLOT()

    property string urlBilderForWebSocket: ""
    property string remamberUserGrupChat:""

    //map config
    property double mapCoordinateLatitude:0
    property double mapCoordinateLongitude:0

    property double mayCoordinateLongitude:30
    property double mayCoordinateLatitude:50
    property double mayMarkerLongitude:31
    property double mayMarkerLatitude:50
    property double centrOnMyLongitude:0
    property double centrOnMyLatitude:0
    property double centrOnUserLongitude:0
    property double centrOnUserLatitude:0
    property double activeLongitude:30.5238000
    property double activeLatitude: 50.4546600
    property var addOffset: 0
    property var addLimit: 9
    //
    property bool accountInfoBool: false
    property bool accountMyInfoBool: false
    property int accountInfoAnimation:0
    property string nameOfTheDialog:""
    property int timeIntervat: 0
    property int reNameChat:0
    property string nameOfDialog: ""
    //user property
    property var myProfil: ""
    property string urlVisible: ""
    property string socketStatusActive:"qrc:/image/accounts/visibleTrue.svg"
    property string myId: ""
    property string myImgId: ""
    property string myUserName: ""
    property string atherUserId: ""
    property string createTetChat: ""
    property string atherLinck:""
    property string myAvatarClicked: ""
    property string dialogIdUser: ""
    property string interlocutor: ""
    property string searchUserInFriend:""
    property string searchDialogInFriend:""
    property string searchActive:""
    property string criateDialog:"No"
    property string writeOrCreate: ""
    property string onlineUser: ''
    property string bykvaNameInTheUserName: ""
    property string peopleStatusOnlireOrNotColor: ""
    property string avaIcoS: ""
    property double latitudeCoord: 0
    property double longitudeCoord:0
    property bool itemGupAutorVisible:true
    property bool liblist: false
    property string textIsOnlineStatusUser: ""
    property int writeAnimationRectangle: 1
    property int contactSize: 0
    property int currentMenueIndex: 0
    property int visibleIcoSearch: 0
    property string emailUser:""
    property string backgroundVisibleShadow:""
    property string nameOfTheClickUser: ""
    property string itsNewChat: ''
    property string nameDialogToCreate: ""
    //cache propenty

    property var cacheDialogList:[]
    property var cacheContactList:[]
    property var cacheChatUserList:[]
    property var offerColection: []

    //grupChatProperty
    property var listPeopleAddToChat: []
    property string dialogNameOfTheGrupChat:""
    property var unicalPeopleList: []
    property string criateGrupDialog: ""
    property var peopleInTheChat:[]

    //Right menue option
    property int switchOptionalRightMenue:0
    //sms setting
    property string userMessageText:""
    property int whenISend:0
    property int seqr: 0
    property string bodyNotification: ""
    //create chat
    property var massPeople: []
    property int createNewTetChatPeople: 0
    property string notificationLoader: ""
    property string howINotRead: ""

    //websocket
    property int loaderMyid:0

    //friend property
    property int indexCheckedInTabBar: 0
    //exit property
    property int exitMode: 0

    ///contactlistProperty
    property var contactList:[ ]
    /// url  offer
    property string publickHastFoTheUser:""
    property string urlHistoryTransaction: "http://gup.com.ua:3000/bc/get-contracts-list/"
    property string urlCreateTransaction: "http://gup.com.ua:33333/cors/http://gup.com.ua:3000/bc/create-transaction"
    property string offerListF:"http://gup.com.ua:8184/api/offers/"
    property string offerListS: "/seourl"
    property var offerSEOUrl:[]
    property string urlOfferFromSEO: "http://gup.com.ua:8184/api/offers/"

    // linking source
    property string imgUrlF:"http://gup.com.ua:8184/api/rest/fileStorage/profile/photo/read/id/"
    property string imgUrlS:"?cachedSize=small"
    property string imgUrlSLARGE: "?cachedSize=large"
    property string offerImgIdF:"http://gup.com.ua:8184/api/offers/image/"
    property string offerImgIdS:"/MEDIUM"
    property string offerImgIdSLarge:"?cachedSize=large"
    property string webSocketUrl: "ws://gup.com.ua:3570"
    property string profilUrl: 'http://gup.com.ua:8184/api/rest/profilesService/profile/read/id/'
    property string addContactF: "http://gup.com.ua:8184/api/rest/profilesService/profile/id/"
    property string addContactS:"/myContactList/add"
    property string tokenUSL: ''

    //profilAvatarConfig
    property bool fixconfig: false
    property int counter: 0

    //property lick form
    property string autorizateURL: "qrc:/qml/authorization/enter/Enter.qml"
    property string friendUrl:""//"qrc:/qml/friend/Friend.qml"
    property string menueUrl:""//"qrc:/qml/menu/Menu.qml"
    property string stGupSource: ""
    property string dialogListAndContactList: ""
    property string qwe: "qrc:/qml/friend/Contact.qml"
    property string webLinck:  "qrc:/qml/websocket/GeneralWebSocket.qml"
    property string registrationURL: ""
    property string swipeByChatConfig: ""
    property string peopleWhoSelectedURL: ""
    property string createNewGrupChat: ""
    // GEO property
    property int flickableChatInterphase: 0
    property int boolAnimationStarted: 0
    property string clearPO:""

    property int animationContactGrupChatTrue:0
    property int animationContactGrupChatFalse:0
    property string firstClick:""

    property bool createGrupChatVisible:false

    Rectangle {
        id:blueRect
        width: monitorWidth
        height: monitorHeigth

        OpacityAnimator {
            id:opacityBlueBoxUP
            target: blueRect;
            from: 0;
            to: 1;
            duration: 1000
            running: false
        }
        Loader {
                id:registrationGup
                source: registrationURL
                opacity: 0

            }
        SequentialAnimation {
            id:regSeq
            NumberAnimation { target: enterGup; property: "opacity"; to: 0.0; duration: 200}
            NumberAnimation { target: registrationGup; property: "opacity"; to: 1.0; duration: 200}
        }
       Loader {
                id: enterGup
                source: autorizateURL
            }
       SequentialAnimation {
           id:enterSeq
           NumberAnimation { target: enterGup; property: "opacity"; to: 1.0; duration: 200}
           NumberAnimation { target: registrationGup; property: "opacity"; to: 0.0; duration: 200}
       }

        OpacityAnimator {
            id:opacityBlueBoxDown
            target: blueRect;
            from: 1;
            to: 0;
            duration: 1000
            running: false
        }


    }

    Rectangle{
        id:redBox 
        width: monitorWidth
        height: monitorHeigth
        x:sizeWidthConfig * 480 
        Behavior on x {
            NumberAnimation {
                duration: 200
            }
        }
        Loader {
                id: friendLoader
                source: friendUrl
            }
        Loader {
                id: menueLoader
                source: menueUrl
            }
        OpacityAnimator {
            id:opacityRedBoxUP
            target: redBox ;
            from: 0;
            to: 1;
            duration: 1000
            running: false
        }
        OpacityAnimator {
            id:opacityRedBoxDown
            target: redBox;
            from: 1;
            to: 0;
            duration: 1000
            running: false
        }
    }
    Rectangle{
        id:greyBox
        width: monitorWidth
        height: monitorHeigth
        x:sizeWidthConfig * 480
        Loader{
            id:chatSwiper
            source: swipeByChatConfig
        }
        Behavior on x {
            NumberAnimation {
                duration: 200
            }
        }
        OpacityAnimator {
            id:opacityGrayBoxDown
            target: greyBox;
            from: 1;
            to: 0;
            duration: 1000
            running: false
        }
    }

    Rectangle{
        id:whiteBox

        width: monitorWidth
        height: monitorHeigth
        x:sizeWidthConfig * 480
        Loader{
            id:peopleWhoSelected
            source: peopleWhoSelectedURL
        }
        Behavior on x {

            NumberAnimation {
                duration: 200
            }
        }

        OpacityAnimator {
            id:opacityWhiteBoxDown
            target: whiteBox;
            from: 1;
            to: 0;
            duration: 1000
            running: false
        }
    }

    Rectangle{
        id:lightWiteBox
        width: monitorWidth
        height: monitorHeigth
        x:sizeWidthConfig * 480
        Loader{
            id:createGrupChat
            source:createNewGrupChat
        }

        Behavior on x {
            NumberAnimation {
                duration: 200
            }
        }

        OpacityAnimator {
            id:lightWite
            target: whiteBox;
            from: 1;
            to: 0;
            duration: 1000
            running: false
        }
    }

    /*  SwipeView {
        id: view
        //interactive:false
        currentIndex: 1
        anchors.fill: parent
        Item {
            id: registration
            Loader {
                    id:registrationGup
                    source: registrationURL
                }
        }
        Item {
            id: enterToGUP
            Loader {
                    id: enterGup
                    source: autorizateURL
                }
        }
        Item {
            id: dialogOrContact
            Loader {
                    id: friendLoader
                    source: friendUrl
                }
            Loader {
                    id: menueLoader
                    source: menueUrl
                }
        }

        Item {
            id: chatOrContact
            Loader{
                id:chatSwiper
                source: swipeByChatConfig
            }
        }
        Item {
            id: selectedPeople
            Loader{
                id:peopleWhoSelected
                source: peopleWhoSelectedURL
            }
        }
    }*/
}
