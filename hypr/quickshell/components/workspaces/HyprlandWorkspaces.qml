import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

ColumnLayout {
    Repeater {
        model: Hyprland.monitors
        delegate: ColumnLayout {
            Text {
                text: "Monitor: " + modelData.name
                color: "white"
                font.pixelSize: 14
                Layout.alignment: Qt.AlignHCenter
            }
            Repeater {
                model: modelData.workspaces
                delegate: Text {
                    text: modelData.name
                    color: Hyprland.activeWorkspace.id === modelData.id ? "yellow" : "white"
                    font.pixelSize: 16
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
}
