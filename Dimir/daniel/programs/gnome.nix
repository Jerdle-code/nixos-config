{ config, pkgs, lib, ... }:
{
  options = {
    local.daniel.desktop.gnome.enable = lib.mkEnableOption ''
      Customised GNOME Shell desktop.
    '';
  };
  config = lib.mkIf config.local.daniel.desktop.gnome.enable {
    services.xserver.desktopManager.gnome.enable = true;
  };
}
