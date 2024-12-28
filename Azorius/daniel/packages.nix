{ config, pkgs, lib, ... }:
{
 #nixpkgs.config.allowUnfree = true;
  home.packages = (with pkgs; [
      firefox
      fastfetch
      lm_sensors
      htop
      dconf-editor
      pavucontrol
      pamixer
      pandoc
      python3
      podman-desktop
    ])
    ++
    (with pkgs.kdePackages; [
    breeze
    breeze-gtk
    breeze-icons
    qt6ct
    konsole
    kcalc
    kate
    dolphin
]);
  programs.zsh = {
    enable = true;
    initExtra = "fastfetch";
    oh-my-zsh = {
        enable = true;
        theme = "tjkirch";
    };
  };
}
