{
  pkgs,
  lib,
  ...
}:
{
  home.packages =
    (with pkgs; [
      libreoffice-still
      firefox
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
