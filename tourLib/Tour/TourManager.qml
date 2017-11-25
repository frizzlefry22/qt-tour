pragma Singleton
import QtQuick 2.7
import QtQuick.Controls 2.0

/*!
  TourManager
  A singleton which coordinates all the Steps and TourBackdrop.
  The TourManager's signals can be called from any code which imports Tour, and all the Signals will be notified.

  */
Item {

    id : tour

    /*!
        This property sets the backdrops visibility.
      */
    property bool backdropVisible: false

    /*!
      This property keeps track of the current step in a tour run.
      */
    property int currentStepIndex: 0

    /*
      Signal emitted when the tour starts, or restarts.
     */
    signal start()

    /*
      Signal emitted when the tour is to halt.
      */
    signal stop()

    /*
      Signal emitted when the tour advances its current step.
      */
    signal next()

    /*!
      Signal emitted when tour step is set to previous step.
      */
    signal previous()

    onStart: {

        //Resets Step Z if Start is clicked multiple times.
        if (tour.backdropVisible) {
            tour.hideStep()
        }
        tour.currentStepIndex = 0
        tour.showStep(tour.currentStepIndex)
        tour.backdropVisible = true
    }

    onNext: {
        tour.currentStepIndex++
        tour.showStep(tour.currentStepIndex)
    }

    onStop: {
        tour.backdropVisible = false
        tour.hideStep()
    }

    onPrevious: {
        tour.currentStepIndex--
        tour.showStep(tour.currentStepIndex)
    }

    //Signals for Steps
    /*!
      Signal emitted to the steps which indicates which one to show.
      */
    signal showStep(int index)

    /*!
      Signal emitted to all steps indicating that Steps are to be hidden.
      */
    signal hideStep
}
