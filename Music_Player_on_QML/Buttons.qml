import QtQuick 6.0
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia 6.5

Rectangle {
    // anchors {
    //     top: parent.top
    //     horizontalCenter: parent.horizontalCenter
    //     topMargin: parent.height * 0.5
    // }
    width: parent.width * 0.83
    height: Math.min(window.height * 0.15, 100)
    border.color: "#A0B3BA"
    border.width: 2
    radius: 20
    color: "#32404B"

    Row{
        spacing: window.height * 0.1
        anchors.centerIn: parent
        Button {
            id: backward
            height: Math.min(window.height * 0.12, 70)
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Back.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.position = player.position - 5000;
        }

        Button {
            id: stop
            height: Math.min(window.height * 0.12, 70)/*window.height * 0.12*/ //60
            width: height/*Math.min(height, 70)*/
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Stop.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.stop()
        }

        Button {
            id: play
            height: Math.min(window.height * 0.12, 70)
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Play.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: {
            player.play();
            player.source = trackListModel.get(0).trackUrl;
            }
        }

        Button {
            id: pause
            height: Math.min(window.height * 0.12, 70)
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Pause.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.pause();
        }

        Button {
            id: forward
            height: Math.min(window.height * 0.12, 70)
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Forward.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.position = player.position + 5000;
        }
    }
}
