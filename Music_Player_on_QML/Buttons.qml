import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts

Row{
spacing: 40
    Button {
        id: back
        height: 60
        width: height
        hoverEnabled: false
        background: Image {
            source: "qrc:/resource/Back.png"
            fillMode: Image.PreserveAspectFit
        }
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
    }

    Button {
        id: forward
        height: 60
        width: height
        hoverEnabled: true
        background: Image {
            source: "qrc:/resource/Forward.png"
            fillMode: Image.PreserveAspectFit
        }
    }

}
