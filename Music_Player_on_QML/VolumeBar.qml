import QtQuick 6.0
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia 6.5



Column {
    spacing: 10
    Slider {
        id: volumeSlider
        width: Math.min(window.height * 0.3, 200)
        from: 0
        to: 100
        value: audioOutput.volume * 100
        onValueChanged: audioOutput.volume = value / 100
        stepSize: 1

        background: Rectangle {
            x: volumeSlider.leftPadding
            y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
            implicitWidth: width
            implicitHeight: Math.min(window.height * 0.025, 15)
            width: volumeSlider.availableWidth
            height: implicitHeight
            radius: 15
            color: "#32404B"
            border.color: "black"
            border.width: 2

            Rectangle {
                width: volumeSlider.visualPosition * parent.width
                height: parent.height
                color: "#1CD2FF"
                radius: 15
                border.color: "black"
                border.width: 2
            }
        }

        handle: Rectangle {
            x: volumeSlider.leftPadding + volumeSlider.visualPosition * (volumeSlider.availableWidth - width)
            y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
            implicitWidth: Math.min(window.height * 0.03, 20)
            implicitHeight: Math.min(window.height * 0.03, 20)
            radius: 15
            color: volumeSlider.pressed ? "#E3EEFA" : "#ffffff"
            border.color: "black"
            border.width: 1
        }
    }

    Text {
        anchors {
            left: volumeSlider.left
            leftMargin: Math.min(window.height * 0.077, 65)
            top: volumeSlider.top
            topMargin: 20
        }
        text: "Volume " + Math.round(volumeSlider.value) + "%"
        font.pixelSize: Math.min(window.height * 0.03, 15)
        color: "white"
    }

}
