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
            text: "Menu screen"
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }

        // We'll implement the 1..10 grid in Commit #3
        Label {
            text: "Next: grid buttons 1..10 + navigation to Screen1"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
