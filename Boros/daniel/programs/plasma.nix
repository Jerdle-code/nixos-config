{ config, pkgs, lib, ... }:
{
  options = {
    local.daniel.desktop.plasma.enable = lib.mkEnableOption ''
      Customised Plasma 6 desktop.
    '';
  };
  config = lib.mkIf config.local.daniel.desktop.plasma.enable {
    services.desktopManager.plasma6.enable = true;
        home-manager.users.daniel.home.packages = (with pkgs.kdePackages; [
        yakuake
        ]);
          home-manager.users.daniel.qt = {
  enable = true;
      platformTheme.package = with pkgs.kdePackages; [
        plasma-integration
        systemsettings
    ];
#  platformTheme.name = "kde";
  style.name = "kvantum";
};
home-manager.users.daniel.systemd.user.sessionVariables = { QT_QPA_PLATFORMTHEME = "kde"; };
 home-manager.users.daniel.programs.plasma = {
    enable = true;
    overrideConfig = true;
     workspace = {
      clickItemTo = "open"; # If you liked the click-to-open default from plasma 5
      theme = "darkcold";
      cursor = {
        theme = "Night Diamond (Blue)";
        size = 32;
      };
      iconTheme = "crystal-remix";
      wallpaper = "/mnt/data/Documents/nixos-hex-bg.png";
      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "__aurorae__svg__nightglowblue";
      };
    };
    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Return";
      command = "konsole";
    };
    shortcuts = {
      "yakuake"."toggle-window-state" = "F8,F12,Open/Retract Yakuake";
    };
    panels = [
      {
        location = "top";
        height = 26;
        widgets = [
        "org.kde.plasma.windowlist"
          "org.kde.plasma.appmenu"
          {
          panelSpacer = {
            expanding = true;
          };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
          {
          panelSpacer = {
            expanding = true;
          };
          }
          {
            systemTray.items = {
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
              ];
            };
          }
          {
            kickerdash = {
              icon = "nix-snowflake-white";
            };
          }
        ];
      }
    ];
    kwin = {
      effects = {
        blur = {
          enable = true;
          noiseStrength = 3;
          strength = 8;
        };
        cube.enable = true;
        dimAdminMode.enable = true;
        fallApart.enable = true;
        minimization = {
          animation = "magiclamp";
          duration = 100;
        };
        shakeCursor.enable = true;
        translucency.enable = true;
        windowOpenClose.animation = "scale";
        wobblyWindows.enable = true;
      };
      nightLight = {
        enable = true;
        location = {
          latitude = "56.6731";
          longitude = "-3.0044";
        };
        mode = "times";
        temperature = {
          day = 6500;
          night = 3500;
        };
        time = {
          evening = "22:00";
          morning = "07:00";
        };
        transitionTime = 30;
      };
      virtualDesktops = {
        number = 4;
        rows = 1;
      };
    };
  };
};
}
