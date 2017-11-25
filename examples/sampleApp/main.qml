import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

import Tour 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("QT Tour")

    Button {

        text: "Foo Button"
        anchors.left: parent.left
        anchors.top: parent.top
        Step {
            message: "This foo button has a popup."
            popup.x: parent.width
            popup.y: parent.height
        }
    }

    Rectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        height: 250
        width: 200
        color: "cyan"
        Step {
            id: step2
            index: 1
            customPopup: true
            popup.parent: ApplicationWindow.overlay
            popup.x: (popup.parent.width / 2) - (popup.width / 2)
            popup.y: (popup.parent.height / 2) - (popup.height / 2)
            popup.contentItem: Column {
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Highlighting a Pane"
                }
                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "You can step back in the popup."
                    onClicked: TourManager.previous()
                }
            }
        }
    }

    Loader {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        height: 50
        source: 'qrc:/LoadedContent.qml'
        Step {
            index: 2
        }
    }

    TourBackdrop {
        //This is needed once
    }

    footer: ToolBar {
        ToolButton {
            text: "Start Tour"
            onClicked: TourManager.start()
            anchors.left: parent.left
        }
        ToolButton {
            id: nextStepButton
            text: "Next Step"
            onClicked: TourManager.next()
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ToolButton {
            id: prevButton
            text: "Prev Step"
            onClicked: TourManager.previous()
            anchors.right: nextStepButton.left
        }

        ToolButton {
            text: "Stop Tour"
            onClicked: TourManager.stop()
            anchors.right: parent.right
        }
    }
}
