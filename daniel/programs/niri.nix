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
  config = lib.mkIf config.local.daniel.desktop.wayfire.enable {
    programs.niri.enable = true;
    local.daniel.program.waybar.enable = true;
    local.daniel.desktop.none.enable = true;
  };
}
