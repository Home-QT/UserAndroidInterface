import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    id: dialogCalendar
    // Задаём размеры диалогового окна
    width: sizeWidthConfig *  250
    height: sizeHeigthConfig * 300
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
                swipeUrl = "qrc:/qml/friend/Friend.qml"
                swipeUrl = "qrc:/qml/menu/Menu.qml"
            }
        }
    }
    // Создаем контент диалогового окна
     Rectangle {
        id: dialogRect
        color: "#f7f7f7"

        // Первым идёт кастомный календарь
        Calendar {
            id: calendar
            // Размещаем его в верхней части диалога и растягиваем по ширине
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: row.top

            // Стилизуем Календарь
            style: CalendarStyle {

                // Стилизуем navigationBar
                navigationBar: Rectangle {
                    /* Он будет состоять из прямоугольника,
                     * в котором будет располагаться две кнопки и label
                     * */
                    height: sizeHeigthConfig * 48
                    color: "#f7f7f7"

                    /* Горизонтальный разделитель,
                     * который отделяет navigationBar от поля с  числами
                     * */
                    Rectangle {
                        color: "#d7d7d7"
                        height: sizeHeigthConfig * 1
                        width: sizeWidthConfig *  parent.width
                        anchors.bottom: parent.bottom
                    }

                    // Кнопка промотки месяцев назад
                    Button {
                        id: previousMonth
                        width: sizeWidthConfig *  parent.height - 8
                        height: sizeHeigthConfig * width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 8

                        /* По клику по кнопке вызываем функцию
                         * календаря, которая отматывает месяц назад
                         * */
                        onClicked: control.showPreviousMonth()

                        // Стилизуем кнопку
                        style: ButtonStyle {
                            background: Rectangle {
                                // Окрашиваем фон кнопки
                                color: "#f7f7f7"
                                /* И помещаем изображение, у которго будет
                                 * два источника файлов в зависимости от того
                                 * нажата кнопка или нет
                                 */
                                Image {
                                    source: control.pressed ? "left_arrow_disable.png" : "left_arrow.png"
                                    width: sizeWidthConfig *  parent.height - 8
                                    height: sizeHeigthConfig * width
                                }
                            }
                        }
                    }

                    // Помещаем стилизованный label
                    Label {
                        id: dateText
                        /* Забираем данные из title календаря,
                         * который в данном случае не будет виден
                         * и будет заменён данным label
                         */
                        text: styleData.title
                        color:  "#34aadc"
                        elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 16
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: previousMonth.right
                        anchors.leftMargin: 2
                        anchors.right: nextMonth.left
                        anchors.rightMargin: 2
                    }

                    // Кнопка промотки месяцев вперёд
                    Button {
                        id: nextMonth
                        width: sizeWidthConfig *  parent.height - 8
                        height: sizeHeigthConfig * width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right

                        /* По клику по кнопке вызываем функцию
                         * календаря, которая отматывает месяц назад
                         * */
                        onClicked: control.showNextMonth()

                         // Стилизуем кнопку
                        style: ButtonStyle {
                            // Окрашиваем фон кнопки
                            background: Rectangle {
                                color: "#f7f7f7"
                                /* И помещаем изображение, у которго будет
                                 * два источника файлов в зависимости от того
                                 * нажата кнопка или нет
                                 */
                                Image {
                                    source: control.pressed ? "right_arrow_disable.png" : "right_arrow.png"
                                    width: sizeWidthConfig *  parent.height - 8
                                    height: sizeHeigthConfig * width
                                }
                            }
                        }
                    }
                }


                // Стилизуем отображением квадратиков с числами месяца
                dayDelegate: Rectangle {
                    anchors.fill: parent
                    anchors.margins: styleData.selected ? -1 : 0
                    // Определяем цвет в зависимости от того, выбрана дата или нет
                    color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"

                    // Задаём предопределённые переменные с цветами, доступные только для чтения
                    readonly property color sameMonthDateTextColor: "#444"
                    readonly property color selectedDateColor: "#34aadc"
                    readonly property color selectedDateTextColor: "white"
                    readonly property color differentMonthDateTextColor: "#bbb"
                    readonly property color invalidDateColor: "#dddddd"

                    // Помещаем Label для отображения числа
                    Label {
                        id: dayDelegateText
                        text: styleData.date.getDate() // Устанавливаем число в текущий квадрат
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignRight
                        font.pixelSize: 10

                        // Установка цвета
                        color: {
                            var theColor = invalidDateColor; // Устанавливаем невалидный цвет текста
                            if (styleData.valid) {
                                /* Определяем цвет текста в зависимости от того
                                 * относится ли дата к выбранному месяцу или нет
                                 * */
                                theColor = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                                if (styleData.selected)
                                    // Перекрашиваем цвет текста, если выбрана данная дата в календаре
                                    theColor = selectedDateTextColor;
                            }
                            theColor;
                        }
                    }
                }
            }
        }
    }
}


