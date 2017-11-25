import QtQuick 2.9
import QtQuick.Controls 2.2

import Tour 1.0

Item {

    id: step

    property int index: 0

    property string message: ""

    property alias popup: stepPopup

    property real prevZ: 0

    objectName: "STEP" + index

    Popup {

        id: stepPopup

        Label {

            text: step.message
        }
    }

    Connections {

        target: TourManager

        onShowStep: {

            if (index === step.index) {
                step.prevZ = step.parent.z
                step.parent.z += 1
                if (message) {
                    stepPopup.open()
                }
            } else {
                step.parent.z = step.prevZ
                if (stepPopup.visible) {
                    stepPopup.close()
                }
            }
        }

        onHideStep: {
            step.parent.z = step.prevZ
            if (stepPopup.visible) {
                stepPopup.close()
            }
        }
    }
}
