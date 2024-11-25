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
    ];
    local.daniel.desktop.plasma.enable = true;
}
