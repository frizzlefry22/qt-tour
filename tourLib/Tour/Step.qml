import QtQuick 2.7
import QtQuick.Controls 2.0

import Tour 1.0

/*!
  Step
  A tour step
  */
Item {

    id: step

    /*!
      This property represents which step in the tour this is.
      */
    property int index: 0

    /*!
      This property sets the optional message.
      */
    property string message: ""

    /*!
      This proeprty exposes the inner popup so it can be customized on a step by step basis.
    */
    property alias popup: stepPopup


    /*
      This property represents the previous z value of the Steps parent.  When the step, is no longer active it resets its parent's z value.
      */
    property real previousZ: 0

    objectName: "STEP" + index

    Popup {

        id: stepPopup

        closePolicy: Popup.NoAutoClose

        Label {

            text: step.message
        }
    }

    Connections {

        target: TourManager

        onShowStep: {

            if (index === step.index) {
                step.previousZ = step.parent.z
                step.parent.z += 1
                if (message) {
                    stepPopup.open()
                }
            } else {
                step.parent.z = step.previousZ
                if (stepPopup.visible) {
                    stepPopup.close()
                }
            }
        }

        onHideStep: {
            step.parent.z = step.previousZ
            if (stepPopup.visible) {
                stepPopup.close()
            }
        }
    }
}
