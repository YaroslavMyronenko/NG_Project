import QtQuick.Window 6.0
import QtMultimedia 6.5
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
import Qt.labs.folderlistmodel 2.1

Column {
    spacing: 5
    Button {
        height: Math.min(window.height * 0.1, 70)
        width: height
        hoverEnabled: false
        background: Image {
            source: "qrc:/resource/plus.png"
            fillMode: Image.PreserveAspectFit
        }
        onClicked: fileDialog.open()
    }

    FileDialog {
        id: fileDialog
        title: "Select an Audio File"
        nameFilters: ["Audio Files (*.mp3 *.wav *.ogg)", "All Files (*)"]
        onAccepted: {
            if (fileDialog.selectedFiles.length > 0) {
                var file = fileDialog.selectedFiles[0];
                trackListModel.append({ "trackUrl": file});
            }
        }
    }

    ListView {
        spacing: 10
        width: parent.width * 0.8
        height: 20
        model: trackListModel
        delegate: Item {
            width: parent.width
            height: 10
            Row {
                spacing: 10
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    color: "white"
                    font.pixelSize: 15
                    text: model.trackUrl
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: playTrack(index)
            }
        }
    }
}
