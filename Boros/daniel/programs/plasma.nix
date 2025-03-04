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
    shortcuts = {
      "services/org.kde.konsole.desktop"."_launch" = ["Ctrl+Alt+T" "Meta+Return"];
      "yakuake"."toggle-window-state" = "F8,F12,Open/Retract Yakuake";
    };
  };
};
}
