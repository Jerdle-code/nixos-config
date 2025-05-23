{ config, pkgs, lib, ... }:
{
imports = [
./waybar.nix
];
  options = {
    local.daniel.desktop.none.enable = lib.mkEnableOption ''
      WM only.
    '';
  };
  config = lib.mkIf config.local.daniel.desktop.none.enable {
      home-manager.users.daniel.services.gammastep = {
        enable = true;
        dawnTime = "08:00";
        duskTime = "22:00";
        temperature = {
        day = 6500;
        night = 3700;
        };
    };
    home-manager.users.daniel.services.mako.enable = true;
    home-manager.users.daniel.services.mako.settings = {
        default-timeout = 4000;
        background-color = "#2a2e32";
        border-radius = 20;
        font = "monospace 12";
        padding = "10";
        height = 300;
        width = 500;
    };
    home-manager.users.daniel.home.packages = (with pkgs; [
        wofi
        fuzzel
        mako
        avizo
        brightnessctl
        gammastep
        networkmanagerapplet
        nwg-look
        keepassxc
        swaybg
      ]);
  };
}
