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
  programs.zsh = {
    enable = true;
    initExtra = "fastfetch";
    oh-my-zsh = {
        enable = true;
        theme = "tjkirch";
    };
  };
}
