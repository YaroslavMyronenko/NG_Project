import QtQuick.Layouts
import QtQuick 6.0
import QtQuick.Controls 6.0
import QtMultimedia 5.15
import QtQuick.Window 6.0


//Progress Bar
//Slider background
Rectangle{
    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
        topMargin: parent.height * 0.49
    }
    width: parent.width * 0.95
    height: 85
    border.color: "white"
    border.width: 2
    radius: 12
    color: "grey"
//Column for slider and time bar
    Column{
        spacing: 3.5
        anchors.centerIn: parent
        width: parent.width * 0.95

//Slider

        Slider {
            id: progress
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 1
            from: 0
            to: player.duration
            value: player.position
            stepSize: 1000
            onMoved: player.position = value
            onValueChanged: if  (pressed) player.position = value;
            Layout.fillWidth: true

//Slider customization

            background: Rectangle{
                x: progress.leftPadding
                y: progress.topPadding + progress.availableHeight / 2 - height / 2
                implicitWidth: progress.width
                implicitHeight: 30
                radius: 5
                height: implicitHeight
                width: progress.availableWidth
                color: "white"
                border.color: "black"
                border.width: 2

                Rectangle {
                    width: progress.visualPosition * parent.width
                    height: parent.height
                    color: "#21be2b"
                    radius: 5
                    border.color: "black"
                    border.width: 2
                }
            }

            handle: Rectangle {
                x: progress.leftPadding + progress.visualPosition * (progress.availableWidth - width)
                y: progress.topPadding + progress.availableHeight / 2 - height / 2
                implicitWidth: 25
                implicitHeight: 40
                radius: 5
                color: progress.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "black"
                border.width: 1
            }
        }
//Time bar
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5
            Text {
                text: formatTime(player.position)
                font.pixelSize: 17
                color: "white"
            }
            Text {
                text: "/"
                font.pixelSize: 17
                color: "white"
            }
            Text {
                text: formatTime(player.duration)
                font.pixelSize: 17
                color: "white"
            }
        }
    }
}


