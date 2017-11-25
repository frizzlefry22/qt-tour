# qt-tour
A QML Tour module for Qt Quick Programs.

Add Steps to QML Items you wish to focus on in sequential order.  Steps can be added in any file as long as Tour Module is loaded.

[SampleApp](imgs/SampleApp.png)

Example Use

```qml
import Tour 1.0
 
    Button {
       text: "Foo Button"
       anchors.left: parent.left
       anchors.top: parent.top
       
       //Add a Step to whatever you want to focus on in the Tour
       Step {
            message: "This foo button has a popup."
            popup.x: parent.width
            popup.y: parent.height
            index : 0
        }
    }

    TourBackdrop {
        //This is needed once
        //You can customize the backdrop color and it will expand ApplicationWindow
    }

    /////
    ToolButton {
            text: "Start Tour"
            onClicked: TourManager.start()
            anchors.left: parent.left
    }
    ToolButton {
            text: "Next Step"
            onClicked: TourManager.next()
            anchors.horizontalCenter: parent.horizontalCenter
    }
````

Works with

*   Items
*   Loaders

Requires

* ApplicationWindow (QtQuick.Controls 2.0)