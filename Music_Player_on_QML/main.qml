import QtQuick.Window 6.0
import QtQuick.Layouts
import QtQuick 6.0
import QtQuick.Controls 6.0
import QtMultimedia 6.5

Window {
    id: window
    visible: true
    width: 600
    height: 400
    title: "QML Music Player"
    minimumHeight: 400
    minimumWidth: 600

AudioOutput {
    id: audioOutput
    volume: 0.7
    }

MediaPlayer {
    id: player
    source: "file:///C:/Users/Ярослав/Documents/My hom/Music/t-fest_-_uleti_(zf.fm).mp3"
    autoPlay: folse
    audioOutput: audioOutput
}

PlayerLayout {
anchors.centerIn: parent
}

Buttons {
    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
        topMargin: parent.height * 0.3
    }
}

VolumeBar{
    anchors {
        right: parent.right
        rightMargin: Math.min(window.height * 0.35, 230)
        top: parent.top
        topMargin: 65
    }
}

// ProgressBar {


// }

//Progress Bar
//Slider background
Rectangle{
    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
        topMargin: parent.height * 0.49
    }
    width: parent.width * 0.95
    height: window.height * 0.2
    border.color: "#B9D8E4"
    border.width: 2
    radius: 15
    color: "#32404B"
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
                implicitHeight: window.height * 0.09
                radius: 10
                height: implicitHeight
                width: progress.availableWidth
                color: "#116C6C"
                border.color: "black"
                border.width: 1

                Rectangle {
                    width: progress.visualPosition * parent.width
                    height: parent.height
                    color: "#36F3F3"
                    radius: 10
                    border.color: "black"
                    border.width: 1
                }
            }

            handle: Rectangle {
                x: progress.leftPadding + progress.visualPosition * (progress.availableWidth - width)
                y: progress.topPadding + progress.availableHeight / 2 - height / 2
                implicitWidth: window.width * 0.03
                implicitHeight: window.height * 0.1
                radius: 10
                color: progress.pressed ? "#EBFAFA" : "#FFFFFF"
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
                font.pixelSize: window.height * 0.035
                color: "white"
            }
            Text {
                text: "/"
                font.pixelSize: window.height * 0.035
                color: "white"
            }
            Text {
                text: formatTime(player.duration)
                font.pixelSize: window.height * 0.035
                color: "white"
            }
        }
    }
}





function formatTime(milliseconds) {
    let seconds = Math.floor(milliseconds / 1000);
    let minutes = Math.floor(seconds / 60);
    seconds = seconds % 60;

    return (minutes < 10 ? "0" + minutes : minutes) + ":" +
           (seconds < 10 ? "0" + seconds : seconds);
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





