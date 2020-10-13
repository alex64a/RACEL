import QtQuick 2.0
import "components"

Rectangle {
    id: rectangle1
    width: 640
    height: 480
    color: "#eeeeee"

    Text {
        id: text1
        x: 86
        y: 34
        width: 444
        height: 28
        text: qsTr("QML Thermometer Component Example")
        visible: true
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.family: "DejaVu Sans"
        font.pixelSize: 18
    }

    HorizontalSlider {
        id: sliderHorizontal1
        x: 228
        y: 369
        width: 184
        height: 48
        allowDrag: true
        imageTrack: "images/slider_htrack.png"
        hintBorderColor: "#000000"
        hintWidth: 40
        imageOverlay: ""
        hintRadius: 9
        imageHandle: "images/slider_handle.png"
        showHint: true
        maximum: 10
        value: 0
        hintBackgroundColor: "#ffffff"
        hintFontColor: "#000000"
        hintBorderWidth: 2
        handleY: 2
        hintFontFamily: "DejaVu Sans"
        hintHeight: 40
        xMin: 0
        minimum: 0
        hintFontPixelSize: 16

        onValueChanged: thermo.value = value;
    }

    Thermometer {
        id: thermo
        x: 278
        y: 98
        width: 51
        height: 217
        color: "#00000000"
        scaleFontPixelSize: 13
        max: 10
        scaleFontFamily: "DejaVu Sans"
        tickLength: 4
        indicatorLightColor: "#fd5656"
        indicatorWidth: 8
        scaleFontColor: "#000000"
        tickInterval: 2
        min: 0
        indicatorMainColor: "#ff0000"
        scaleFontStyle: "normal"
        value: 0
    }

    Component.onCompleted:{

    }

}
