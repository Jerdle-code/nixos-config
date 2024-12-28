{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "darkcold-plasma5-theme";
  version = "20241023";

  src = fetchFromGitHub {
    owner = "originalseed";
    repo = "kvdarkcold";
    rev = "9ff9f6c14e1bfab9559c8dabe16bd0b9fec7a962";
    sha256 = "sha256-FVcpU64dMTzW08bbdu/mxxgP1HbhlNnf+0WLfvygLTM=";
    sparseCheckout = [
      "plasma/plasma5darkcold"
    ];
  };

    installPhase = ''
    mkdir -p $out/share/plasma/desktoptheme/darkcold
    cp -va plasma/plasma5darkcold/* $out/share/plasma/desktoptheme/darkcold/
  '';

  meta = {
    description = "DarkCold, a sleek dark skeuomorphic KDE/Kvantum theme (Plasma 5 theme). Ported from GTK theme that dates back to 2010.";
    homepage = "https://github.com/originalseed/kvdarkcold";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.all;
  };
}
