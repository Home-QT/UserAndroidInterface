import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtLocation 5.5
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtPositioning 5.2

Item {
    property string colorProperty: '#' + ((Math.random() * 0x1000000) | 0x1000000).toString(16).substr(1)

    RouteModel {
        id: routeModel
        plugin : map.plugin
        query:  RouteQuery {
            id: routeQuery
        }
        onStatusChanged: {
            if (status == RouteModel.Ready) {
                console.log("Ready viewer")
            } else if (status == RouteModel.Error) {
                console.log("Error viewer")
            }
        }
    }


    Image {
        id:lockDown
        x:sizeWidthConfig *200
        z:8
        y:sizeHeigthConfig* 50
        width: sizeWidthConfig * imageLineMapClose.width
        height: sizeHeigthConfig * imageLineMapClose.height
        source: "qrc:/image/map/pimgpsh_fullsize_distr.png"
    }


    Component {
        id: routeDelegate


        MapRoute {
            z:5
            route: routeData
            line.color: "#46a2da"
            line.width: 5
            smooth: true
            opacity: 0.8
        }
    }
    property variant transportUse
    property variant fromCoordinate: QtPositioning.coordinate(centrOnMyLatitude,centrOnMyLongitude )
    property variant toCoordinate: QtPositioning.coordinate(mapCoordinateLatitude, mapCoordinateLongitude)

    function mapwiewer(){
        // clear away any old data in the query
        routeQuery.clearWaypoints();

        // add the start and end coords as waypoints on the route
        routeQuery.addWaypoint(fromCoordinate)
        routeQuery.addWaypoint(toCoordinate)
        if (transportUrl === "qrc:/image/map/CarTravel.png"){
            routeQuery.travelModes =  RouteQuery.CarTravel
        }
        if(transportUrl === "qrc:/image/map/PedestrianTravel.png"){
            routeQuery.travelModes =  RouteQuery.PedestrianTravel
        }
        if(transportUrl === "qrc:/image/map/PublicTransitTravel.png"){
            routeQuery.travelModes = RouteQuery.PublicTransitTravel
        }

        routeQuery.routeOptimizations = RouteQuery.FastestRoute
        console.log(routeQuery.waypoints)
        routeModel.update();

        // center the map on the start coord
        map.center = fromCoordinate;
    }

    Map {
        width: monitorWidth
        height: monitorHeigth
        id: map
        plugin: Plugin {name: "osm"}
        zoomLevel:14
        center {
            latitude: activeLatitude
            longitude:  activeLongitude
        }
        /*Location {
            id:loacare
            coordinate: QtPositioning.coordinate(-27.5, 153.1)
        }
        MapQuickItem {
            id:marker1
            sourceItem:Rectangle{
                width: imgMyAvatarStyle1.width
                height: imgMyAvatarStyle1.height
                color: "transparent"
                Image{
                id: imgMarker1
                source: "qrc:/image/map/googleMarker.svg"
                visible: false
                }

                ColorOverlay {
                    id:littleMarker1
                    anchors.fill: imgMarker1
                    source: imgMarker1
                    color: ""+colorProperty+""
                    opacity: 1
                }

            }
            coordinate: loacare.coordinate
        }*/
        Loader{
            id:webSocketLoaderPos


        }
        MapItemView {
            model: routeModel
            delegate: routeDelegate
        }

        Location {
                    id:loacare
                    coordinate: QtPositioning.coordinate(mapCoordinateLatitude,mapCoordinateLongitude)
                }

        MapQuickItem {
            id:marker
            sourceItem:Rectangle{
                width: imgMyAvatarStyle.width
                height: imgMyAvatarStyle.height
                color: "transparent"
                Image{
                    id: imgMarker
                    source: "qrc:/image/map/marker2.svg"
                    width: imgMyAvatarStyle.width*2
                    height: imgMyAvatarStyle.height
                    visible: false

                }

                ColorOverlay {
                    id:littleMarker
                    anchors.fill: imgMarker
                    source: imgMarker
                    color: ""+colorProperty+""
                    opacity: 1
                }
            }
             coordinate: loacare.coordinate
        }

        MapQuickItem {
            id:myAavtarStyle

            sourceItem: Rectangle{
                width: imgMyAvatarStyle.width
                height: imgMyAvatarStyle.height
                color: "transparent"
                Image{
                    id: imgMyAvatarStyle
                    source: "qrc:/image/map/placeholder.svg"
                    visible: false
                }
                Rectangle {
                    id: background
                    z:1
                    x:2
                    y:2
                    width: sizeWidthConfig * 32
                    height: sizeHeigthConfig * 32
                    radius: sizeWidthConfig * 32/2

                }
                Image {
                    id: myAva
                    x:2
                    y:2
                    visible: false
                    width: sizeWidthConfig * 32
                    height: sizeHeigthConfig * 32
                    source: imgUrlF + myImgId +imgUrlS
                    //layer.enabled: rounded
                    fillMode: Image.PreserveAspectCrop
                    asynchronous: true
                    smooth: true
                }
                OpacityMask {

                    id: roundedPhoto
                    z:1
                    anchors.fill: background
                    source: myAva
                    maskSource: background
                    //visible: (roundedPhoto.status==Image.Ready)

                }

                ColorOverlay {
                    id:littleAddedChat
                    anchors.fill: imgMyAvatarStyle
                    source: imgMyAvatarStyle
                    color: ""+colorProperty+""
                    opacity: 1
                }
            }
            coordinate: QtPositioning.coordinate( centrOnMyLatitude  ,  centrOnMyLongitude )
        }

        MouseArea {
            anchors.fill: parent
            onPressAndHold: {
                routeQuery.clearWaypoints();
                imgMarker.visible = true
                marker.coordinate = map.toCoordinate(Qt.point(mouse.x-(imgMarker.width/2.5),mouse.y-imgMarker.height))
                mapCoordinateLongitude = String(marker.coordinate.longitude)
                mapCoordinateLatitude = String(marker.coordinate.latitude)
                //console.log(mapCoordinateLongitude,mapCoordinateLatitude )
            }
        }
    }


    /*Timer {
        id:timer
        interval: 1000; running: true; repeat: true;

        onTriggered:{
            webSocketLoaderPos.source = ""
            webSocketLoaderPos.source = "qrc:/qml/websocket/GeneralWebSocket.qml"
        }
    }*/

    PositionSource {
        id: src
        updateInterval: 100
        active: true
        onPositionChanged: {
            //webSocketLoaderPos.source = "qrc:/qml/websocket/GeneralWebSocket.qml"
            console.log("done")
            var coord = src.position.coordinate;
            centrOnMyLongitude = coord.longitude
            centrOnMyLatitude = coord.latitude
            console.log("Coordinate:", coord.longitude, coord.latitude);
        }
    }


    Image {
        id: imageIdCentrMe
        y:500
        x:370
        z:3
        width:120
        height: 130
        source: "qrc:/image/map/centrMe.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                map.center = fromCoordinate;
            }
        }
    }

    function addImageTransport(){
        var youChoseTransport = ["qrc:/image/map/CarTravel.png","qrc:/image/map/PedestrianTravel.png","qrc:/image/map/PublicTransitTravel.png"]
        for(var i = 0; i < youChoseTransport.length;i++){
        listModelTravel.append({imageTrevelUrl:youChoseTransport[i]})
        }
        console.log(JSON.stringify(listModelTravel))
    }

    property string transportUrl: ""

    Component {
        id: travelDelegat
            Column {
                Rectangle{
                    width: imageTrevelUrl.width
                        height:imageTrevelUrl.heigth
                    Image {
                        width:sizeWidthConfig * 120
                        height:sizeHeigthConfig * 130
                    source: imageTrevelUrl
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {

                            transportUrl = imageTrevelUrl

                            travelList.visible = false
                        }

                    }

                    }

                }

            }
    }
    ListModel {
        id: listModelTravel
        ListElement { imageTrevelUrl:''}
    }

    ListView {
        id:travelList
        y:sizeHeigthConfig * 600
        x:sizeWidthConfig * 170
        z:3
        width: sizeWidthConfig * 500
        height: sizeHeigthConfig * 400
        model:listModelTravel
        delegate: travelDelegat
        spacing:100
        orientation: ListView.Horizontal
    }
    Image {
        id: imageIdSearchTransport
        y:sizeHeigthConfig * 600
        x:sizeWidthConfig * 370
        z:3
        width:sizeWidthConfig * 120
        height: sizeHeigthConfig * 130
        source: transportUrl
        MouseArea{
            anchors.fill:parent
            onClicked: {
                mapwiewer()
            }

        }
    }

    Image {
        id: imageIdSearchWay
        y:sizeHeigthConfig * 600
        x:sizeWidthConfig * 370
        z:3
        width:sizeWidthConfig * 120
        height: sizeHeigthConfig * 130
        source: "qrc:/image/map/way.png"
        MouseArea{
            anchors.fill:parent
            onClicked: {
                imageIdSearchWay.visible = false
                listModelTravel.clear()
                addImageTransport()
                //mapwiewer()
            }

        }
    }

    Rectangle{
        id:backDropDown
        z:2
        y:sizeHeigthConfig * 650

        width:sizeWidthConfig * 480
        height:sizeHeigthConfig * 150
        Text {
            x:15
            y:5
            id: nameOfTheDialogChat
            text:nameOfDialog
            font.pixelSize: 35
        }
    }

    DropShadow {
        anchors.fill: backDropDown
        z:1
        radius: 6.0
        opacity: 0.24
        color: "#000000"
        source: backDropDown
    }


}
