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
 home-manager.users.daniel.programs.plasma = {
    enable = true;
     workspace = {
      clickItemTo = "open"; # If you liked the click-to-open default from plasma 5
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Night Diamond (Blue)";
        size = 32;
      };
      iconTheme = "crystal-remix";
      wallpaper = "/mnt/data/Documents/nixos-hex-bg.png";
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
          {
            applicationTitleBar = {
              behavior = {
                activeTaskSource = "activeTask";
              };
              layout = {
                elements = [ "windowTitle" ];
                horizontalAlignment = "left";
                showDisabledElements = "deactivated";
                verticalAlignment = "center";
              };
              overrideForMaximized.enable = false;
              windowTitle = {
                font = {
                  bold = false;
                  fit = "fixedSize";
                  size = 12;
                };
                hideEmptyTitle = true;
                margins = {
                  bottom = 0;
                  left = 10;
                  right = 5;
                  top = 0;
                };
                source = "appName";
              };
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.marginsseparator"
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
          "org.kde.plasma.marginsseparator"
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
  };
};
}
