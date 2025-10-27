import QtQuick
import QtQuick.Layouts

ColumnLayout {
    id: root

    property string compositor: "Hyprland" // or "MangoWC"

    Text {
        text: "Workspaces / Tags"
        color: "white"
        font.pixelSize: 18
        Layout.alignment: Qt.AlignHCenter
    }

    Loader {
        id: backendLoader
        source: compositor === "Hyprland" ? "workspaces/HyprlandWorkspaces.qml" : "workspaces/MangoWCWorkspaces.qml"
    }
}
