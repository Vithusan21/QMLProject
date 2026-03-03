import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

import QMLProject

Item {
    id: root
    required property StackView stack
    required property var timer

    // A slightly darker, soft background color
    Rectangle {
        anchors.fill: parent
        color: "#e0e5ec"
    }

    GridLayout {
        columns: 5
        rowSpacing: 44
        columnSpacing: 44
        anchors.centerIn: parent

        Repeater {
            model: 10

            Item {
                id: neumorphicButton
                width: 110
                height: 110

                Rectangle {
                    id: card
                    anchors.fill: parent
                    radius: 14
                    // LOGIC: If mouse is over the MouseArea, use E3E4FF, else use base color
                    color: cardMouseArea.containsMouse ? "#E3E4FF" : "#e0e5ec"

                    // Smooth transition when hovering
                    Behavior on color { ColorAnimation { duration: 150 } }
                }

                // --- NEUMORPHIC SHADOWS ---
                MultiEffect {
                    x: -10; y: -10
                    width: card.width + 20
                    height: card.height + 20
                    source: card
                    shadowEnabled: true
                    shadowOpacity: 0.15
                    shadowBlur: 1.0 
                    shadowHorizontalOffset: 6
                    shadowVerticalOffset: 6
                }

                MultiEffect {
                    x: -10; y: -10
                    width: card.width + 20
                    height: card.height + 20
                    source: card
                    shadowEnabled: true
                    shadowColor: "#ffffff" 
                    shadowOpacity: 0.7
                    shadowBlur: 1.0
                    shadowHorizontalOffset: -6
                    shadowVerticalOffset: -6
                }

                // --- INTERACTION ---
                MouseArea {
                    id: cardMouseArea
                    anchors.fill: parent
                    hoverEnabled: true // Required to detect the hover state

                    onClicked: {
                        if (index === 0) {
                            stack.push("Screen1.qml", { stack: stack, timer: timer })
                        }
                    }

                    onPressed: {
                        card.scale = 0.98
                        neumorphicButton.y += 2
                    }
                    onReleased: {
                        card.scale = 1.0
                        neumorphicButton.y -= 2
                    }
                    onCanceled: {
                        card.scale = 1.0
                        neumorphicButton.y -= 2
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: (index + 1).toString()
                    // If hovered, make the text a bit darker to contrast with E3E4FF
                    color: cardMouseArea.containsMouse ? "#030848" : "#606a78"
                    font.pixelSize: 22
                    font.weight: Font.DemiBold
                }
            }
        }
    }
}