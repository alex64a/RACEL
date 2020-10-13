import QtQuick 2.0
import HelperWidgets 2.0
import QtQuick.Layouts 1.0

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Thermometer")

        SectionLayout {

            Label {
                text: qsTr("Min")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.min
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {

                }
            }

            Label {
                text: qsTr("Max")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.max
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {

                }
            }

            Label {
                text: qsTr("Value")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.value
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {

                }
            }

            Label {
                text: "Tick Length"
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.tickLength
                    minimumValue: 0
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {

                }
            }

            Label {
                text: "Tick Interval"
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.tickInterval
                    minimumValue: 0
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {

                }
            }

            Label {
                text: "Indicator Width"
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.indicatorWidth
                    minimumValue: 0
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {

                }
            }

        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Indicator Main Color")

        ColorEditor {
            caption: qsTr("Main Color")
            backendValue: backendValues.indicatorMainColor
            supportGradient: true
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Indicator Light Color")

        ColorEditor {
            caption: qsTr("Light Color")
            backendValue: backendValues.indicatorLightColor
            supportGradient: true
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Scale Font Color")

        ColorEditor {
            caption: qsTr("Scale Font Color")
            backendValue: backendValues.scaleFontColor
            supportGradient: true
        }
    }

    Section{
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Font")

        SectionLayout{
            Label {
                text: qsTr("Font Family")
            }

            SecondColumnLayout {

                FontComboBox{
                    backendValue: backendValues.scaleFontFamily
                }

                ExpandingSpacer {

                }
            }

            Label {
                text: qsTr("Font Size")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.scaleFontPixelSize
                    minimumValue: 0
                    maximumValue: 50
                    decimals: 0
                }

                ExpandingSpacer {

                }
            }

            Label {
                text: qsTr("Font Style")
            }

            SecondColumnLayout {
                ReachComboBox{
                    backendValue: backendValues.scaleFontStyle
                    model: ["normal", "bold", "italic"]
                    Layout.fillWidth: true
                }

                ExpandingSpacer {

                }
            }
        }
    }


}


