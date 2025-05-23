{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./waybar.nix
      ./hyprland.nix
      ./plasma.nix
      ./gnome.nix
      ./wayfire.nix
      ./none.nix
      ./niri.nix
    ];
    local.daniel.desktop.niri.enable = true;
}
