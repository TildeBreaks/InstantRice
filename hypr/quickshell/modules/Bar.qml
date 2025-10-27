import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.SystemTray
import "../components/Workspaces.qml" as WorkspacesModule

Item {
    id: root

    property int barWidth: 200

    width: barWidth
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    Connections {
        target: Shell
        function onCompositorNameChanged() {
            workspaces.compositor = Shell.compositorName
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.7
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 15

        WorkspacesModule.Workspaces {
            id: workspaces
            compositor: Shell.compositorName === "Hyprland" ? "Hyprland" : "MangoWC"
        }

        Text {
            id: clock
            color: "white"
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: "Network: " + (NetworkManager.primaryConnection?.id || "Disconnected")
            color: "white"
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: "Audio: " + (PipeWire.devices.find(d => d.direction === "Output")?.volume * 100).toFixed(0) + "%"
            color: "white"
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.fillHeight: true
        }

        SystemTray {
            id: tray
            Layout.alignment: Qt.AlignHCenter
            iconSize: 32
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            clock.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
        }
    }
}
