import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    required property StackView stack

    // Tweaks for consistent mockup-like sizing
    readonly property int rowHeight: 44
    readonly property int labelWidth: 380
    readonly property int fieldWidth: 380
    readonly property int buttonWidth: 320
    readonly property int boxMaxWidth: 860

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 18

        Label {
            text: "screen 1"
            font.pixelSize: 28
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
        }

        // Center the groupbox like the mockup
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            GroupBox {
                id: formBox
                title: "GroupBox title"

                anchors.horizontalCenter: parent.horizontalCenter
                width: Math.min(parent.width, boxMaxWidth)

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 18
                    spacing: 14

                    // Row 1: title1 + field1
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 18

                        Label {
                            id: title1
                            text: "title1 (Label)"
                            Layout.preferredWidth: labelWidth
                            Layout.preferredHeight: rowHeight
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            padding: 8
                        }

                        TextField {
                            id: field1
                            text: "0"
                            readOnly: true
                            Layout.preferredWidth: fieldWidth
                            Layout.preferredHeight: rowHeight
                            horizontalAlignment: TextInput.AlignHCenter
                        }
                    }

                    // Row 2: title2 + field2
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 18

                        Label {
                            id: title2
                            text: "title2 (Label)"
                            Layout.preferredWidth: labelWidth
                            Layout.preferredHeight: rowHeight
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            padding: 8
                        }

                        TextField {
                            id: field2
                            placeholderText: "Field2 (LineEdit)"
                            Layout.preferredWidth: fieldWidth
                            Layout.preferredHeight: rowHeight
                            horizontalAlignment: TextInput.AlignHCenter
                        }
                    }

                    // Buttons (centered, stacked)
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 12

                        Button {
                            id: btn1
                            text: "Btn1 (Button)"
                            checkable: true
                            Layout.preferredWidth: buttonWidth
                            Layout.preferredHeight: rowHeight

                            onToggled: {
                                // backend wiring later (Commit #5/#6)
                                console.log("btn1 toggled:", checked)
                            }
                        }

                        Button {
                            id: btn2
                            text: "Btn2 (Button)"
                            Layout.preferredWidth: buttonWidth
                            Layout.preferredHeight: rowHeight

                            onClicked: {
                                // temporary UI reset; backend wiring later
                                field1.text = "0"
                                console.log("btn2 clicked")
                            }
                        }
                    }

                    // Row 3: title4 + field4
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 18

                        Label {
                            id: title4
                            text: "title4 (Label)"
                            Layout.preferredWidth: labelWidth
                            Layout.preferredHeight: rowHeight
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            padding: 8
                        }

                        TextField {
                            id: field4
                            placeholderText: "Field4 (LineEdit)"
                            Layout.preferredWidth: fieldWidth
                            Layout.preferredHeight: rowHeight
                            horizontalAlignment: TextInput.AlignHCenter
                        }
                    }
                }
            }
        }
    }
}
