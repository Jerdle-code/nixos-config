{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "darkcold-kvantum-theme";
  version = "20241023";

  src = fetchFromGitHub {
    owner = "originalseed";
    repo = "kvdarkcold";
    rev = "9ff9f6c14e1bfab9559c8dabe16bd0b9fec7a962";
    sha256 = "sha256-jdbGSuAP2fYrP7XVysYgOtaDR3cDaYSLFEcORrEC6Ec=";
    sparseCheckout = [
      "KvDarkCold"
    ];
  };

  installPhase = ''
    mkdir -p $out/share/Kvantum/
    cp -var KvDarkCold $out/share/Kvantum/
  '';

  meta = {
    description = "DarkCold, a sleek dark skeuomorphic KDE/Kvantum theme (Kvantum theme). Ported from GTK theme that dates back to 2010.";
    homepage = "https://github.com/originalseed/kvdarkcold";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.all;
  };
}
