import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    height: 84
    color: "#030848" 

    property bool canGoBack: false
    signal backRequested()
    property int activeTab: 0

    RowLayout {
        anchors.fill: parent
        anchors.margins: 18
        spacing: 12

        
        Button {
            id: backBtn
            visible: root.canGoBack
            text: "\u2190"
            onClicked: root.backRequested()

            // Corrected size for a rectangular look
            implicitWidth: 60 
            implicitHeight: 40

            background: Rectangle {
                radius: 8 // Rounded rectangle, not a circle
                color: backBtn.pressed ? "#6659FC" : "#292E7B"
                border.color: "#3d4491"
                border.width: 1
            }
            contentItem: Text {
                text: backBtn.text
                color: "white"
                font.pixelSize: 22
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Item { Layout.fillWidth: true }

        // Navigation Tabs
        RowLayout {
            spacing: 14

            Repeater {
                model: [
                    { label: "A", idx: 0 },
                    { label: "B", idx: 1 },
                    { label: "C", idx: 2 }
                ]

                Button {
                    id: tabButton
                    text: modelData.label
                    hoverEnabled: true
                    onClicked: root.activeTab = modelData.idx

                    implicitWidth: 52
                    implicitHeight: 52

                    background: Rectangle {
                        radius: 12
                        // LOGIC FOR YOUR 3 COLORS:
                        // 1. If active index OR currently being pressed -> Bright Purple (#6659FC)
                        // 2. Otherwise -> Muted Indigo (#292E7B)
                        color: (root.activeTab === modelData.idx || tabButton.pressed) 
                               ? "#6659FC" 
                               : "#292E7B" // The box when not clicked

                        // Optional: subtle border to match the "box" look in image_60bc65
                        border.color: "white"
                        border.width: (root.activeTab === modelData.idx) ? 1 : 0
                        opacity: (root.activeTab === modelData.idx || tabButton.hovered) ? 1.0 : 0.9

                        Behavior on color { ColorAnimation { duration: 100 } }
                    }

                    contentItem: Text {
                        text: tabButton.text
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }

        Item { Layout.fillWidth: true }
    }
}