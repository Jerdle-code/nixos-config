{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "darkcold-plasma6-theme";
  version = "20241023";

  src = fetchFromGitHub {
    owner = "originalseed";
    repo = "kvdarkcold";
    rev = "9ff9f6c14e1bfab9559c8dabe16bd0b9fec7a962";
    sha256 = "sha256-eQwipo/FRi8Vb41yHRiF5P8Y5XO1ccyFStwgPI0D8eg=";
    sparseCheckout = [
      "plasma/plasma6darkcold"
    ];
  };

    installPhase = ''
    mkdir -p $out/share/plasma/desktoptheme/darkcold
    mkdir -p $out/share/color-schemes
    cp -va plasma/plasma6darkcold/* $out/share/plasma/desktoptheme/darkcold/
    cp -va plasma/plasma6darkcold/colors $out/share/color-schemes/DarkCold.colors
  '';

  meta = {
    description = "DarkCold, a sleek dark skeuomorphic KDE/Kvantum theme (Plasma 6 theme). Ported from GTK theme that dates back to 2010.";
    homepage = "https://github.com/originalseed/kvdarkcold";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.all;
  };
}
