{ config, pkgs, lib, ... }:
{
 #nixpkgs.config.allowUnfree = true;
  home.packages = (with pkgs; [
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
      gimp-with-plugins
      protontricks
      musescore
      lmms
      hydrogen
      gnubg
      dconf-editor
      wvkbd
      webcamoid
      praat
      pavucontrol
      pamixer
      pandoc
      python3
      crystal-dock
#      sage
      krita
      brave
      libreoffice-fresh
#      wxmaxima
      golly
    ])
    ++
    (with pkgs.kdePackages; [
    breeze
    breeze-gtk
    breeze-icons
    qtstyleplugin-kvantum
    qt6ct
    konsole
    kcalc
    okular
    kolourpaint
    gwenview
    kate
    plasmatube
    dolphin
    ark
    discover
    kwalletmanager
]) ++ (with lib.packagesFromDirectoryRecursive{
inherit (pkgs) callPackage;
directory = ./. + "/../packages";
};
[
crystal-remix-icon-theme
darkcold-gtk-theme
darkcold-kvantum-theme
darkcold-plasma6-theme
e17gtk-revolved
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
