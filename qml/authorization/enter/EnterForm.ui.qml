import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0


Item {
    id: formItem
    width: monitorWidth
    height: monitorHeigth
    property alias rectangle: rectangle
    Rectangle {
        id: rectangle
    }
}
