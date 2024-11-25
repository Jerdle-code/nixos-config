{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./none.nix
    ];
  options = {
    local.daniel.desktop.wayfire.enable = lib.mkEnableOption ''
      Customised Wayfire desktop.
    '';
  };
  config = lib.mkIf config.local.daniel.desktop.wayfire.enable {
  local.daniel.desktop.none.enable = true;
    programs.wayfire = {
  enable = true;
  plugins = with pkgs.wayfirePlugins; [
    wcm
   wf-shell
   wayfire-plugins-extra
    firedecor
     ];
 };
  };
}
