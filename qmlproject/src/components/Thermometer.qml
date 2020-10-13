import QtQuick 2.0

Rectangle {
    id: thermometer
    // Width of component in pixels
    width: 40
    // Height of component in pixels
    height: 190
    // Background color of the component
    color: "transparent"
    // Minumum value for the Thermometer
    property real min: 0
    // Maximum value for the Thermometer
    property real max: 10
    // Current value for the Thermometer
    property real value
    // Main color for the Thermometer used to create gradient
    property color indicatorMainColor: "#FF0000"
    // Light color for the Thermometer used to create gradient
    property color indicatorLightColor: "#fd5656"
    // Interval between ticks
    property real tickInterval: 2
    // Length of tick marks in pixels
    property int tickLength: 4
    // Scale font size in pixels
    property int scaleFontPixelSize: 13
    // Scale font family
    property string scaleFontFamily: "DejaVu Sans"
    // Scale font style normal, bold
    property string scaleFontStyle: "normal"
     // Scale font color
    property color scaleFontColor: "#000000"
    // Adjustment used for drawing the thermometer.  This is used to keep the top most text (max) visible
    property real heightAdjustment: scaleFontPixelSize
    // Calculate the distance between tick marks
    property real offset: (height-heightAdjustment*2) / (max - min)
    // Used to draw the top and bottom arc
    property real radius
    // Width of the indicator
    property int indicatorWidth: 40
    // boolean property used so we don't redraw the tickmarks
    property bool firstRun: true

    onValueChanged: {
        canvas.requestPaint();
    }

    Canvas{
        id: canvas
        width: parent.width
        height: parent.height
        anchors.right: parent.right

        onPaint: {
            if (value < min)
                value = min;
            else if (value > max)
                value = max;

            var ctx = canvas.getContext("2d");

            // Set scale font properties to measure text
            ctx.font= scaleFontStyle + " " + scaleFontPixelSize + "px '" + scaleFontFamily + "'";
            ctx.fillStyle = "#000000"

            // Calculate the longest text
            var longestText = Math.max(ctx.measureText(min.toString()).width,
                                       ctx.measureText(max.toString()).width);
            // x position where we will draw the Tank
            var xPos = longestText + tickLength + 1;
            // Set the radius for the top and bottom arcs
            radius = (width - longestText - tickLength + 1)/2;

            if (heightAdjustment < radius)
                heightAdjustment = radius;

            // Clear the thermometer area
            ctx.clearRect(xPos, heightAdjustment, width, height);

            // Draw the thermometer base - I'm using a gray linear gradient to show an empty thermometer with a cylindrical shape
            var grBase = ctx.createLinearGradient(xPos, 0, width, 0);
            //Add color stops
            grBase.addColorStop(0, "#919db2");
            grBase.addColorStop(0.5, "#ffffff");
            grBase.addColorStop(1, "#919db2");
            ctx.fillStyle = grBase;
            ctx.fillRect(xPos, heightAdjustment, width, height - heightAdjustment*2);

            // Draw the top arc
            ctx.beginPath();
            ctx.arc(longestText + tickLength + radius, heightAdjustment + 1, radius-1, 0, Math.PI, true);
            ctx.fill();

            // Draw the indicator based on the value
            var grTank = ctx.createLinearGradient(xPos, 0, width, 0);
            grTank.addColorStop(0, indicatorMainColor);
            grTank.addColorStop(0.5, indicatorLightColor);
            grTank.addColorStop(1, indicatorMainColor);
            ctx.fillStyle = grTank;

            // Determine the pos to draw the indicator rectangle
            var widthOffset = (width - xPos - indicatorWidth)/2;
            ctx.fillRect(xPos + widthOffset, ((max - min - value) * offset) + heightAdjustment , indicatorWidth, height);
            //Clear excess from bottom
            ctx.clearRect(xPos, height - heightAdjustment, width, heightAdjustment);

            // Draw the bottom arc
            ctx.fillStyle = grTank;
            ctx.beginPath();
            ctx.arc(longestText + tickLength + radius, height - heightAdjustment, radius-1, Math.PI, 2*Math.PI, true);
            ctx.fill();

            if (firstRun)
            {
                // Draw the scale text and tick marks
                ctx.font = scaleFontStyle + " " + scaleFontPixelSize + "px '" + scaleFontFamily + "'";
                ctx.fillStyle = scaleFontColor;
                var pos = 0;

                for (var i=max; i >= min; i=i-tickInterval)
                {
                    ctx.fillText(i.toString(), 0, pos*offset + heightAdjustment + 12/4);

                    //Tick marks
                    ctx.beginPath();
                    ctx.moveTo(longestText + 1, pos*offset + heightAdjustment);
                    ctx.lineTo(longestText + tickLength + 1, pos*offset + heightAdjustment);
                    ctx.stroke();

                    pos += tickInterval;

                }
            }

            firstRun = false;

        }
    }


}

