{
  ...
}:
{
  imports = [
    ./waybar.nix
    ./hyprland.nix
    ./plasma.nix
    ./gnome.nix
    ./wayfire.nix
    ./none.nix
    ./niri.nix
  ];
  local.daniel.desktop.hyprland.enable = true;
  local.daniel.desktop.plasma.enable = true;
}
