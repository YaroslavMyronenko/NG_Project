import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick 2.15
import QtMultimedia 6.5
import Time 1.0


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
    ListModel {
        id: trackListModel
    }
}

Progress {
    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
        topMargin: parent.height * 0.49
    }
    TimeFormat{
        id: time
    }
}









}


