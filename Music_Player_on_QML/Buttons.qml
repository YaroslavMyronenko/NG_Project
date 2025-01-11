import QtQuick 6.0
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia 6.5

    Row{
        spacing: 40
        Button {
            id: backward
            height: 60
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Back.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.position = value + 5000
        }

        Button {
            id: stop
            height: 60
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Stop.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.stop()
        }

        Button {
            id: play
            height: 60
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Play.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.play();
        }

        Button {
            id: pause
            height: 60
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
            height: 60
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Forward.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.seek(player.position + 5000)
        }
    }
