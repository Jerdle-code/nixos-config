{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "darkcold-gtk-theme";
  version = "20231023";

  src = fetchFromGitHub {
    owner = "originalseed";
    repo = "darkcold";
    rev = "71f8fec1fbd62e1bf94fae839efea0acbcd30c0d";
    sha256 = "sha256-Wk0TAGRUqAJn7PxyqKV3WnZXx2krEQKF/6KZ+R8ld+U=";
  };

  installPhase = ''
    mkdir -p $out/share/{doc,themes}/darkcold
    cp -va index.theme gtk-2.0 gtk-3.0 gtk-3.20 metacity-1 $out/share/themes/darkcold/
  '';

  meta = {
    description = "DarkCold GTK2 & GTK3 theme";
    homepage = "https://github.com/originalseed/darkcold";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.all;
  };
}
