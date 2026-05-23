{
  pkgs,
  lib,
  ...
}:
{
  home.packages =
    (with pkgs; [
      libreoffice-still
      chromium
      fastfetch
      conky
      kitty
      geany
      pcmanfm-qt
    ])
    ++ (
      with lib.packagesFromDirectoryRecursive {
        inherit (pkgs) callPackage;
        directory = ./. + "/../packages";
      }; [
        crystal-remix-icon-theme
        darkcold-gtk-theme
        darkcold-kvantum-theme
        darkcold-plasma6-theme
        e17gtk-revolved
      ]);
}
