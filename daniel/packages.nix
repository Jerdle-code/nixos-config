{ config, pkgs, lib, ... }:
{
 #nixpkgs.config.allowUnfree = true;
  home.packages = (with pkgs; [
      firefox
      (prismlauncher.override { jdks = [ jdk8 jdk17 jdk21 ]; })
      fastfetch
      superTuxKart
      superTux
      gzdoom
      openttd
      lm_sensors
      ryzenadj
      htop
      texlive.combined.scheme-full
      lyx
      texstudio
      openrct2
      audacity
      gimp
      protontricks
      musescore
      lmms
      hydrogen
      gnubg
      brightnessctl
      gammastep
      nwg-look
      keepassxc
      dconf-editor
      networkmanagerapplet
      wvkbd
      webcamoid
      praat
      pavucontrol
      avizo
      pamixer
      mako
      pandoc
      wofi
      python3
      inkscape
      crystal-dock
      thunderbird
    ])
    ++
    (with pkgs.kdePackages; [
    breeze
    breeze-gtk
    breeze-icons
    qtstyleplugin-kvantum
    qt6ct
    konsole
    yakuake
    kcalc
    okular
    kolourpaint
    gwenview
    kate
    calligra
    plasmatube
    dolphin
    ark
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
