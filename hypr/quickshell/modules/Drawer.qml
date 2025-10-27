import QtQuick
import Quickshell
import Quickshell.Wayland
import "./Bar.qml" as BarModule

PanelWindow {
    id: root

    WlrLayershell.namespace: "fantasypunk-shell"
    WlrLayershell.exclusiveZone: -1
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.anchorTo: WlrAnchors.All
    color: "transparent"

    BarModule.Bar {
        id: bar
    }
}
