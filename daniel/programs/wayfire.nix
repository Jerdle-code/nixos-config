{ config, pkgs, lib, ... }:
{
  options = {
    local.daniel.desktop.wayfire.enable = lib.mkEnableOption ''
      Customised Wayfire desktop.
    '';
  };
  config = lib.mkIf config.local.daniel.desktop.wayfire.enable {
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
