import QtQuick 2.0

Rectangle {
    width: 800
    height: 600

    Rectangle {
        id: rectangle1
        x: 113
        y: 145
        width: 180
        height: 310
        color: "#ffffff"
        border.width: 2

        Rectangle {
            id: rectangle2
            x: 49
            y: 26
            width: 131
            height: 259
            color: "Lime"
            border.width: 2

            Text {
                id: text1
                x: -22
                y: 115
                text: qsTr("Thermometer Area")
                rotation: -90
                font.pixelSize: 21
            }
        }

        Rectangle {
            id: rectangle3
            x: 1
            y: 0
            width: 53
            height: 310
            color: "#ed1b1b"
            border.width: 2

            Text {
                id: text2
                x: -91
                y: 144
                text: qsTr("Tick Mark and Scale Area")
                rotation: -90
                font.pixelSize: 21
            }
        }
    }

    Rectangle {
        id: rectangle4
        x: 140
        y: 437
        width: 2
        height: 50
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle5
        x: 141
        y: 485
        width: 53
        height: 2
        color: "#ffffff"
        border.width: 2
    }

    Text {
        id: text3
        x: 202
        y: 477
        text: qsTr("Width of tick area = longestText + tickWidth + 1")
        font.pixelSize: 15
    }

    Rectangle {
        id: rectangle6
        x: 278
        y: 157
        width: 47
        height: 2
        color: "#ffffff"
        border.width: 2
    }

    Text {
        id: text4
        x: 333
        y: 147
        width: 383
        height: 18
        text: qsTr("Height of white area = heightAdjustment")
        font.pixelSize: 15
    }

    Rectangle {
        id: rectangle7
        x: 278
        y: 440
        width: 47
        height: 2
        color: "#ffffff"
        border.width: 2
    }

    Text {
        id: text5
        x: 333
        y: 429
        text: "Height of white area = heightAdjustment"
        font.pixelSize: 15
    }

}
