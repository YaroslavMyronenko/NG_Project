import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick 2.15
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
    autoPlay: folse
    audioOutput: audioOutput
}
//Track switching function
property int currentIndex: -1
function playTrack(index) {
    if (index >= 0 && index < trackListModel.count) {
        currentIndex = index;
        player.source = trackListModel.get(index).trackUrl;
        player.play();
    }
}


ListModel {
    id: trackListModel
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

AddTrack{
    id: trackList
    anchors {
        bottom: parent.bottom
        bottomMargin: Math.min(window.height * 0.17, 200)
        horizontalCenter: parent.horizontalCenter
        left: parent.left
        leftMargin: Math.min(window.width * 0.01, 100)
    }
}



// ProgressBar {
//     anchors {
//         top: parent.top
//         horizontalCenter: parent.horizontalCenter
//         topMargin: parent.height * 0.49
//     }
// }

// Progress Bar
// Slider background
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

//Function to change time from milliseconds to seconds
function formatTime(milliseconds) {
    let seconds = Math.floor(milliseconds / 1000);
    let minutes = Math.floor(seconds / 60);
    seconds = seconds % 60;
    return (minutes < 10 ? "0" + minutes : minutes) + ":" +
            (seconds < 10 ? "0" + seconds : seconds);
}

}


