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
  platformTheme.name = "kde";
  style.name = "kvantum";
};
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
  };
};
}
