import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

import QMLProject

Item {
    id: root
    required property StackView stack
    required property var timer

    readonly property color bgColor: "#e0e5ec"
    readonly property color sunkenColor: "#d1d9e6"
    
    Rectangle {
        anchors.fill: parent
        color: root.bgColor
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 30

        // Screen Title
        Text {
            text: "Timer Control"
            font.pixelSize: 28
            font.bold: true
            color: "#606a78"
            Layout.alignment: Qt.AlignHCenter
        }

        // Main Form Container
        GroupBox {
            id: formBox
            title: "GroupBox title"

            label: Label {
                    text: formBox.title
                    font.pixelSize: 16
                    font.bold: true
                    color: "#606a78"
                    leftPadding: 12   // spacing before text
                }


            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 400
            
            background: Rectangle {
                color: root.bgColor
                radius: 20

                layer.enabled: true
                layer.effect: MultiEffect {
                    shadowEnabled: true
                    shadowOpacity: 0.1
                    shadowBlur: 1.0
                    shadowHorizontalOffset: 5
                    shadowVerticalOffset: 5
                }
            }

            GridLayout {
                anchors.fill: parent
                anchors.margins: 30
                columns: 2
                rowSpacing: 25
                columnSpacing: 40


                Label { text: "title1 (Label)"; font.pixelSize: 16; color: "#606a78" }
                

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    radius: 10
                    color: root.sunkenColor
                    

                    border.color: "#b8bec9"
                    border.width: 1

                    TextField {
                        id: field1
                        anchors.fill: parent
                        anchors.margins: 2
                        text: timer ? timer.seconds.toFixed(1) : "0.0"
                        readOnly: true
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment: TextInput.AlignVCenter
                        font.pixelSize: 18
                        background: null // Remove default styling
                    }
                }


                Label { text: "title2 (Label)"; font.pixelSize: 16; color: "#606a78" }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    radius: 10
                    color: root.sunkenColor
                    border.color: "#b8bec9"

                    TextField {
                        anchors.fill: parent
                        placeholderText: "Enter text..."
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment: TextInput.AlignVCenter
                        background: null
                    }
                }


                ColumnLayout {
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 15

                    // Btn1: Toggle
                    Button {
                        id: btn1
                        text: checked ? "PAUSE" : "RUN"
                        checkable: true
                        checked: timer ? timer.running : false
                        Layout.preferredWidth: 250
                        Layout.preferredHeight: 50
                        
                        onToggled: {
                            if (checked) timer.start()
                            else timer.pause()
                        }
                    }

                    // Btn2: Reset
                    Button {
                        id: btn2
                        text: "RESET"
                        Layout.preferredWidth: 250
                        Layout.preferredHeight: 50
                        onClicked: timer.reset()
                    }
                }

                // ROW 4: Final Labels
                Label { text: "title4 (Label)"; font.pixelSize: 16; color: "#606a78" }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    radius: 10
                    color: root.sunkenColor
                    border.color: "#b8bec9"

                    TextField {
                        anchors.fill: parent
                        placeholderText: "Field4"
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment: TextInput.AlignVCenter
                        background: null
                    }
                }
            }
        }
    }
}
