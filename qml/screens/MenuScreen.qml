import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    required property StackView stack

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 20

        Label {
            text: "Menu screen"
            font.pixelSize: 28
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
        }

        GridLayout {
            id: grid
            columns: 5
            rowSpacing: 20
            columnSpacing: 20
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                model: 10

                Button {
                    text: index + 1
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 100

                    onClicked: {
                        if (index === 0) {
                            stack.push("Screen1.qml", { stack: stack })
                        }
                    }
                }
            }
        }
    }
}