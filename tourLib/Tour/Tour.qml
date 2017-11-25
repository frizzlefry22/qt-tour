import QtQuick 2.9
import QtQuick.Controls 2.2

import Tour 1.0

Item {

    id: tour

    objectName: "TOUR_MAIN"

    property alias backgroundVisible : background.visible

    property int currentStepIndex : 0

    signal start ()

    signal stop ()

    signal next()

    signal previous()

    onStart: {
        tour.currentStepIndex = 0
        TourManager.showStep(tour.currentStepIndex)
        background.visible = true
    }

    onNext: {
        tour.currentStepIndex++
        TourManager.showStep(tour.currentStepIndex);
    }

    onStop: {
        background.visible = false
        TourManager.hideStep()
    }

    onPrevious: {
        tour.currentStepIndex--
        TourManager.showStep(tour.currentStepIndex)
    }

    Rectangle {

        id : background

        visible: false

        parent : ApplicationWindow.contentItem

        anchors.fill: parent

        color : "Grey"
    }

}
