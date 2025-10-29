import QtQuick 2.15
import QtQuick.Controls 2.15
import "colors.qml" as Theme

ApplicationWindow {
    visible: true
    width: 1920
    height: 30
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    // Load the main bar component
    Bar {
        anchors.fill: parent
    }
}
