import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QMLProject
import App 1.0

ApplicationWindow {
    id: window
    visible: true
    title: "QMLProject"

    width: 1024
    height: 768
    minimumWidth: 1024
    maximumWidth: 1024
    minimumHeight: 768
    maximumHeight: 768

    // Single backend instance shared by screens
    TimerBackend {
        id: timerBackend
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        TopMenuBar {
            id: topBar
            Layout.fillWidth: true

            canGoBack: stackView.depth > 1
            onBackRequested: stackView.pop()
        }

        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true

            initialItem: MenuScreen {
                stack: stackView
                timer: timerBackend
            }
        }
    }
}