import QtQuick 2.7
import QtQuick.Controls 2.0

import Tour 1.0

Item {

    id: tour

    objectName: "TOUR_MAIN"

    property alias backdropVisible: backdrop.visible

    property alias backdropColor : backdrop.color

    property int currentStepIndex: 0

    signal start

    signal stop

    signal next

    signal previous

    onStart: {

        //Resets Step Z if Start is clicked multiple times.
        if (backdrop.visible) {
            TourManager.hideStep()
        }
        tour.currentStepIndex = 0
        TourManager.showStep(tour.currentStepIndex)
        backdrop.visible = true
    }

    onNext: {
        tour.currentStepIndex++
        TourManager.showStep(tour.currentStepIndex)
    }

    onStop: {
        backdrop.visible = false
        TourManager.hideStep()
    }

    onPrevious: {
        tour.currentStepIndex--
        TourManager.showStep(tour.currentStepIndex)
    }

    Rectangle {

        id: backdrop

        visible: false

        parent: ApplicationWindow.contentItem

        anchors.fill: parent

        color: "Grey"
    }
}
