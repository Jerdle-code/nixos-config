{ config, pkgs, lib, ... }:
{
  options = {
    local.daniel.program.waybar.enable = lib.mkEnableOption ''
      Customised Waybar setup.
    '';
  };
  config = lib.mkIf config.local.daniel.program.waybar.enable {
    programs.waybar.enable = true;
    home-manager.users.daniel.programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "layer" = "top";
    "height" = 30;
    "spacing" = 4;
    "modules-center" = [
        "clock"
    ];
    "modules-right" = [
        "power-profiles-daemon"
        "backlight"
	"cpu"
        "memory"
        "temperature"
	"network"
	"battery"
	"pulseaudio"
	"tray"
    ];
    "keyboard-state" = {
        "numlock" = true;
        "capslock"= true;
        "format"= "{name} {icon}";
        "format-icons"= {
            "locked"= "";
            "unlocked"= "";
        };
    };
    "idle_inhibitor"= {
        "format"= "{icon}";
        "format-icons"= {
            "activated"= "";
            "deactivated"= "";
        };
    };
    "tray"= {
        "spacing"= 10;
    };
    "clock"= {
        "tooltip-format"= "<big><tt>{calendar}</tt></big>";
        "format-alt"= "{:%Y-%m-%d}";
    };
    "cpu"= {
        "format"= "{usage}% ";
        "tooltip"= true;
    };
    "memory"= {
        "format"= "{}% ";
    };
    "temperature"= {
        "critical-threshold"= 80;
        "format"= "{temperatureC}°C {icon}";
        "format-icons"= [
        ""
        ""
        ""
        ];
    };
    "backlight"= {
        "format"= "{percent}% {icon}";
        "format-icons"= [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ];
    };
    "battery"= {
        "states"= {
            "warning"= 20;
            "critical"= 10;
        };
        "format"= "{capacity}% {icon}";
        "format-full"= "{capacity}% {icon}";
        "format-charging"= "{capacity}% ";
        "format-plugged"= "{capacity}% ";
        "format-alt"= "{time} {icon}";
        "format-icons"= [
        ""
        ""
        ""
        ""
        ""
        ];
    };
    "power-profiles-daemon"= {
      "format"= "{icon}";
      "tooltip-format"= "Power profile= {profile}\nDriver= {driver}";
      "tooltip"= true;
      "format-icons"= {
        "default"= "";
        "performance"= "";
        "balanced"= "";
        "power-saver"= "";
      };
    };
    "network" = {
        "format-wifi"= "{essid} ({signalStrength}%) ";
        "format-ethernet"= "{ipaddr}/{cidr} ";
        "tooltip-format"= "{ifname} via {gwaddr} ";
        "format-linked"= "{ifname} (No IP) ";
        "format-disconnected"= "Disconnected ⚠";
        "format-alt"= "{ifname}= {ipaddr}/{cidr}";
    };
    "pulseaudio"= {
        "format"= "{volume}% {icon} {format_source}";
        "format-bluetooth"= "{volume}% {icon} {format_source}";
        "format-bluetooth-muted"= " {icon} {format_source}";
        "format-muted"= " {format_source}";
        "format-source"= "{volume}% ";
        "format-source-muted"= "";
        "format-icons"= {
            "headphone"= "";
            "hands-free"= "";
            "headset"= "";
            "phone"= "";
            "portable"= "";
            "car"= "";
            "default"= [
            ""
            ""
            ""
            ];
        };
        "on-click"= "pavucontrol";
    };
    "custom/drawer" = {
    "format"= "⮟";
    "tooltip"= false;
    "on-click"= "exec nwg-drawer";
        };
    "custom/power" = {
    "format"= "⏻";
    "tooltip"= false;
    "on-click"= "exec wlogout";
  };
};
  };
  style =
"
@define-color red #da4453;
@define-color orange #f67400;
@define-color yellow #f6e400;
@define-color green #27ae60;
@define-color blue #3daee9;
@define-color purple #6027ae;
@define-color dark #2a2e32;
@define-color bg rgba(0,0,0,0);
@define-color light #eff0f1;

* {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    font-size: 13px;
}

window#waybar {
    background-color: rgba(0,0,0,0.5);
    border-bottom: 0px solid rgba(100, 114, 125, 0.0);
    color: @light;
    transition-property: background-color;
    transition-duration: .5s;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#keyboard-state,
#idle_inhibitor,
#scratchpad,
#power-profiles-daemon,
#custom-drawer,
#mpd {
background-color: @bg;
    padding: 0 10px;
    color: @light;
    border-bottom: 0px solid rgba(100, 114, 125, 0.0);
}

#window,
#workspaces {
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#clock {
    background-color: @bg;
    color: @light;
    border: 2px @blue solid;
}
#keyboard-state {
    background-color: @bg;
    color: @light;
    border: 2px @dark solid;
}
#custom-drawer {
    background-color: @purple;
    color: @light;
}

#battery {
    background-color: @bg;
    color: @light;
    border: 2px @blue solid;
}
#battery.warning {
    border: 2px @orange solid;
    color: @orange;
}
#battery.charging, #battery.plugged {
    border: 2px @green solid;
    color: @green;
}

#battery.critical:not(.charging) {
    border: 3px @red solid;
    color: @red;
}

#power-profiles-daemon {
    padding-right: 15px;
}

#power-profiles-daemon.performance {
    border: 2px @red solid;
    color: @red;
}

#power-profiles-daemon.balanced {
    border: 2px @blue solid;
    color: @blue;
}

#power-profiles-daemon.power-saver {
    border: 2px @green solid;
    color:@green;
}

label:focus {
    background-color: @dark;
}

#cpu {
    border: 2px @yellow solid;
}

#memory {
    border: 2px @yellow solid;
}

#disk {
    border: 2px @yellow solid;
}

#backlight {
    border: 2px @light solid;
}

#network {
    border: 2px @blue solid;
}

#network.disconnected {
    border: 2px @red solid;
}

#pulseaudio {
    border: 2px @purple solid;
}


#temperature {
    border: 2px @orange solid;
}

#temperature.critical {
    border: 2px @red solid;
}

#tray {
    border: 2px @blue solid;
}";
  };
  };
}
