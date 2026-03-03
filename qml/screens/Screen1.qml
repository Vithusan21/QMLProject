import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    required property StackView stack

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 16

        Label {
            text: "Screen 1"
            font.pixelSize: 28
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
        }

        Label {
            text: "Next: form layout + timer logic"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
        }
    }
}