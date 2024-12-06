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
      inkscape
      crystal-dock
      thunderbird
      libreoffice-fresh
      maxima
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
    plasmatube
    dolphin
    ark
    karousel
]) ++ (map (p: pkgs.callPackage (./. + "/../packages" + ("/" + p)  + "/package.nix") {}) [
"e17gtk-revolved"
"darkcold-plasma6-theme"
"darkcold-kvantum-theme"
"darkcold-gtk-theme"
"crystal-remix-icon-theme"
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
