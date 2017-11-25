import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

import Tour 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Button {

        text : "fooButton"

        anchors.left: parent.left
        anchors.top : parent.top

        Step {

        }
    }

    Button {
        text  :"Foot Button 2"

        anchors.right: parent.right
        anchors.top: parent.top

        Step {
            index: 1
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


    Tour {
        id : qttour
    }

    footer: ToolBar {
        ToolButton {
            text : "Start Tour"
            onClicked: qttour.start()
            anchors.left: parent.left

        }
        ToolButton {
            id : nextStepButton
            text : "Next Step"
            onClicked: qttour.next()
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ToolButton {
            id : prevButton
            text : "Prev Step"
            onClicked: qttour.previous()
            anchors.right: nextStepButton.left
        }


        ToolButton {
            text : "Stop Tour"
            onClicked: qttour.stop()
            anchors.right: parent.right
        }
    }


}
