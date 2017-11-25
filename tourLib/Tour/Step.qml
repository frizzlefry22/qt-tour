import QtQuick 2.9


import Tour 1.0

Item {

    id : step

    property int index : 0

    property real prevZ : 0

    objectName: "STEP" + index

    Connections {

        target: TourManager

        onShowStep : {
            if (index === step.index) {
                step.prevZ = step.parent.z
                step.parent.z += 1
            } else{
                step.parent.z = step.prevZ
            }
        }

        onHideStep : {
            step.parent.z = step.prevZ
        }
    }
}
