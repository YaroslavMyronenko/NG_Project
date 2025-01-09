import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import QtMultimedia 6.5
Window {
    width: 640
    height: 500
    visible: true
    title: qsTr("Player on QML")

PlayerLayout {
anchors.centerIn: parent
}


}




    /*Image {
        anchors.fill: parent
        source: "qrc:/resource/sfu.png"
    }

    Rectangle{
        id: head
        anchors {
        centerIn: parent
        verticalCenterOffset: -70
        }
        antialiasing: true
        border.color: "Black"
        border.width: 1.5
        radius: 15
        height: 300
        width: 120
        color: "Grey"
        Column{
            anchors.centerIn: head
            spacing: 10
            Repeater {
                model: ["Red", "Yellow", "Green"]
                Rectangle {
                    antialiasing: true
                    border.color: "Black"
                    border.width: 1.5
                    radius: 180
                    height: 75
                    width: 75
                    color: modelData
                    Button {
                           id: btn
                           anchors.centerIn: parent
                           width: 50
                           height: 30
                           hoverEnabled: false
                           font.family: "Verdana"
                           icon.source: "qrc:/resource/sfu.png"
                           icon.color: "transparent"
                           Text{
                               text: modelData
                               color: btn.down ? "#c7ecee":"#01a3a4"
                               font.family: "Verdana";
                               font.pixelSize: 14;
                               anchors.centerIn: parent
                                }
                           }
                       }
                }
            }
        }
        Rectangle{
            anchors {
            centerIn: head
            verticalCenterOffset: 198
            }
            antialiasing: true
            border.color: "Black"
            border.width: 1
            radius: 3
            color: "Grey"
            height: 100
            width: 25
            }

        Rectangle{
            anchors {
            centerIn: head
            verticalCenterOffset: 250
            }
            antialiasing: true
            border.color: "Black"
            border.width: 1
            radius: 3
            color: "Grey"
            height: 20
            width: 65
            }
        Column {
                RadioButton {
                    text: "C++"

                    font {family: "Verdana"; pixelSize:15}
                }
                RadioButton {
                    text: "Java"
                    font {family: "Verdana"; pixelSize:15}
                }
            }
        Column{
               padding: 5
               anchors.fill: parent
               Slider {
                   id: slider
                   width: 300
                   from: 0
                   value: 0
                   stepSize: 1
                   to: 100
                   onMoved: {output.text = "Value: " + value}  // Text отображает текущее значение
               }
               Text {
                   id: output
                   font.pixelSize: 15
                   color: "White"
               }
           }
        Column{
                anchors.fill: parent
                padding: 100
                spacing: 5

               TextField{
                    id: colorBox
                    width: 100
                }

                Rectangle {
                    color: colorBox.text
                    width: 100
                    height: 100
                }
            }
        Rectangle {
               x: 10; y: 10        // начальная позиция
               width: 50; height: 50
               color: "red"

               Drag.active: dragArea.drag.active
               Drag.hotSpot.x: 10
               Drag.hotSpot.y: 10

               MouseArea {
                   id: dragArea
                   anchors.fill: parent
                   drag.target: parent
               }
           }*/





