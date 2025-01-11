import QtQuick 6.0
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia 6.5



Column {
    spacing: 10
    Slider {
        id: volumeSlider
        width: 150
        from: 0
        to: 100
        value: audioOutput.volume * 100
        onValueChanged: audioOutput.volume = value / 100
        stepSize: 1
                }
    Text {
        anchors {
            left: volumeSlider.left
            leftMargin: 40
            top: volumeSlider.top
            topMargin: 25
        }
        text: "Volume " + Math.round(volumeSlider.value) + "%"
        font.pixelSize: 15
        color: "white"
    }

}
