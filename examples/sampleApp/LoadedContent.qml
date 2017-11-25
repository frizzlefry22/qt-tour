import QtQuick 2.9
import QtQuick.Controls 2.2

import Tour 1.0

Item {

    id: control

    Button {
        text: "A loaded button."

        Step {
            index: 2
            customPopup: true
            popup.parent: ApplicationWindow.overlay
            popup.x: (popup.parent.width / 2) - (popup.width / 2)
            popup.y: (popup.parent.height / 2) - (popup.height / 2)
            popup.contentItem: Label {
                text: "This Label is being loaded by a Loader. \nBoth the Label and the Loader need to have a Step{} component with the same index."
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
