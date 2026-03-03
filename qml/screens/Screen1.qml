import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    required property StackView stack
    required property var timer

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
                            readOnly: true
                            // Show seconds; timer updates every 0.5s
                            text: timer ? timer.seconds.toFixed(1) : "0.0"
                            Layout.preferredWidth: fieldWidth
                            Layout.preferredHeight: rowHeight
                            horizontalAlignment: TextInput.AlignHCenter
                        }
                    }

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

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 12

                        Button {
                            id: btn1
                            text: "Btn1 (Button)"
                            checkable: true
                            checked: timer ? timer.running : false
                            Layout.preferredWidth: buttonWidth
                            Layout.preferredHeight: rowHeight

                            onToggled: {
                                if (!timer) return
                                if (checked) timer.start()
                                else timer.pause()
                            }
                        }

                        Button {
                            id: btn2
                            text: "Btn2 (Button)"
                            Layout.preferredWidth: buttonWidth
                            Layout.preferredHeight: rowHeight

                            onClicked: {
                                if (!timer) return
                                timer.reset()
                            }
                        }
                    }

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