import QtQuick 2.15
import QtQuick.Controls

Rectangle {
    width: parent.width * 0.83
    height: Math.min(window.height * 0.15, 100)
    border.color: "#A0B3BA"
    border.width: 2
    radius: 20
    color: "#32404B"

    Row{
        spacing: Math.min(window.width * 0.035, 200)
        anchors.centerIn: parent
        Button {
            id: backwardtrack
            height: Math.min(window.width * 0.08, 70)
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Backtrack.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: if (currentIndex > 0)
                playTrack(currentIndex - 1);

        }

        Button {
            id: backward
            height: Math.min(window.width * 0.08, 70)
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
            height: Math.min(window.width * 0.08, 70)
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
            height: Math.min(window.width * 0.08, 70)
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
            height: Math.min(window.width * 0.08, 70)
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
            height: Math.min(window.width * 0.08, 70)
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Forward.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: player.position = player.position + 5000;
        }

        Button {
            id: forwardtrack
            height: Math.min(window.width * 0.08, 70)
            width: height
            hoverEnabled: false
            background: Image {
                source: "qrc:/resource/Forwardtrack.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: if (currentIndex < trackListModel.count - 1)
                playTrack(currentIndex + 1);
        }
    }
}
