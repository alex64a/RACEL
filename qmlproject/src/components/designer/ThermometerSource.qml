import QtQuick 2.0
import "components"

Thermometer {
    width: 40
    height: 190
    color: "transparent"
    min: 0
    max: 10
    value: 0
    indicatorMainColor: "#FF0000"
    indicatorLightColor: "#fd5656"
    tickInterval: 2
    tickLength: 4
    scaleFontPixelSize: 13
    scaleFontFamily: "DejaVu Sans"
    scaleFontStyle: "normal"
    scaleFontColor: "#000000"
    indicatorWidth: 4
}
