import QtQuick.Window 6.0
import QtMultimedia 6.5
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

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
                trackListModel.append({ "trackUrl": file });
            }
        }
    }

    ListView {
        width: parent.width * 0.8
        height: 10
        model: trackListModel
        delegate: Item {
            width: parent.width
            height: 10
            Row {
                spacing: 10
                Text {
                    color: "white"
                    font.pixelSize: 16
                    text: model.trackUrl }
            }
        }
    }
}
