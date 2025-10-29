import QtQuick 2.15
import QtQuick.Layouts 1.15
import Quickshell 0.1
import Quickshell.Services.UPower 0.1 as UPower
import Quickshell.Services.Pipewire 0.1 as Pipewire
import Quickshell.Services.SystemTray 0.1
import Quickshell.Io 0.1
import Quickshell.Hyprland 0.1 as Hyprland

Rectangle {
    id: root
    color: Theme.background

    RowLayout {
        anchors.fill: parent
        spacing: 10

        // Hyprland Workspaces
        Quickshell.Hyprland.Hyprland { id: hyprland }
        RowLayout {
            spacing: 5
            Repeater {
                model: hyprland.workspaces
                delegate: Rectangle {
                    width: 25
                    height: 25
                    color: modelData.active ? Theme.color4 : Theme.color8
                    radius: 5
                    Text {
                        text: modelData.id
                        anchors.centerIn: parent
                        color: Theme.foreground
                    }
                }
            }
        }

        Item { Layout.fillWidth: true }

        // Center-aligned items
        UPower.PowerProfiles { id: powerProfiles }
        Text {
            id: powerProfileText
            text: "Power: " + (powerProfiles.activeProfile ? powerProfiles.activeProfile.name : "N/A")
            color: Theme.foreground
            Layout.alignment: Qt.AlignCenter
        }

        Pipewire {
            id: pipewire
        }
        Text {
            text: "Vol: " + (pipewire.defaultNode ? Math.round(pipewire.defaultNode.volume * 100) + "%" : "N/A")
            color: Theme.foreground
            Layout.alignment: Qt.AlignCenter
        }

        SystemClock {
            id: clock
            timeZone: "auto"
        }
        Text {
            text: clock.time.toLocaleTimeString(Qt.locale(), "hh:mm")
            color: Theme.foreground
            Layout.alignment: Qt.AlignCenter
        }

        Item { Layout.fillWidth: true }

        // Right-aligned items
        SystemTray {
            id: tray
            Layout.fillHeight: true
            Layout.preferredWidth: 100
        }

        Timer {
            interval: 5000 // Update every 5 seconds
            running: true
            repeat: true
            onTriggered: networkProcess.start()
        }

        Process {
            id: networkProcess
            command: "nmcli -t -f GENERAL.STATE,CONNECTION device show $(nmcli -t -f DEVICE connection show --active | head -n1)"
            onFinished: {
                var lines = stdout.split('\n');
                if (lines.length > 1 && lines[0].includes("connected")) {
                   networkText.text = "Net: " + lines[1].split(':')[1]
                } else {
                   networkText.text = "Net: Disconnected"
                }
            }
        }
        Text {
            id: networkText
            text: "Network: ..."
            color: Theme.foreground
        }

        MouseArea {
            Layout.preferredWidth: 100
            Layout.fillHeight: true
            onClicked: {
                logoutProcess.start()
            }
            Text {
                text: "Logout"
                anchors.centerIn: parent
                color: Theme.foreground
            }
        }

        Process {
            id: logoutProcess
            command: "wlogout"
        }
    }
}
