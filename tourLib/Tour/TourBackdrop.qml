import QtQuick 2.9
import QtQuick.Controls 2.2

import Tour 1.0

/*!
  TourBackdrop
  The backdrop which is activated during the tour.
  The backdrops visibility and color may be accessed via alias properties.
  */
Item {

    id: tourBackdrop

    objectName: "TourBackdrop"

    /*!
      This property exposes the backdrop's visibility.
      */
    property alias backdropVisible: backdrop.visible

    /*!
      This property exposes the backdrop's color.  The default is Grey.
      */
    property alias backdropColor : backdrop.color

    Rectangle {

        id: backdrop

        visible: TourManager.backdropVisible

        //Can't use overlay since it sets the Z really high.
        parent: ApplicationWindow.contentItem

        anchors.fill: parent

        color: "Grey"
    }
}
