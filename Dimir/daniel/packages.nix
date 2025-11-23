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
      openrct2
      gimp3-with-plugins
      protontricks
      gnubg
      dconf-editor
      wvkbd
      webcamoid
      pavucontrol
      pamixer
      pandoc
      python3
      crystal-dock
      golly
      audacity
      webcamoid
      nil
      python312Packages.python-lsp-server
      android-tools
      musescore
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
    calligra
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
}
