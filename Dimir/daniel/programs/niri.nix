{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./none.nix
      ./waybar.nix
    ];
  options = {
    local.daniel.desktop.niri.enable = lib.mkEnableOption ''
      Customised Niri desktop.
    '';
  };
  config = lib.mkIf config.local.daniel.desktop.niri.enable {
    programs.niri.enable = true;
    local.daniel.program.waybar.enable = true;
    local.daniel.desktop.none.enable = true;
    home-manager.users.daniel.home.packages = (with pkgs; [
      xwayland-satellite
    ]);
  };
}
