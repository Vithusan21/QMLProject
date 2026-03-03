import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    height: 64
    color: "#d1d5db"   // light gray (you can change later)

    // Controlled from Main.qml
    property bool canGoBack: false
    signal backRequested()

    RowLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        // Left side: Back button (only visible on Screen1)
        Button {
            visible: root.canGoBack
            text: "\u2190"   // arrow
            onClicked: root.backRequested()
        }

        // Center area (a, b, c)
        Item { Layout.fillWidth: true }

        RowLayout {
            spacing: 8
            Button { text: "a" }
            Button { text: "b" }
            Button { text: "c" }
        }

        Item { Layout.fillWidth: true }
    }
}
