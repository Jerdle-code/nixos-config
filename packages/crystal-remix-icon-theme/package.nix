{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "crystal-remix-icon-theme";
  version = "2.4";

  src = fetchFromGitHub {
    owner = "dangvd";
    repo = pname;
    rev = version;
    sha256 = "";
  };
dontDropIconThemeCache = true;
    installPhase = ''
    mkdir -p $out/share/icons/crystal-remix
    cp -va * $out/share/icons/crystal-remix
    gtk-update-icon-cache $out/share/icons/crystal-remix
  '';

  meta = {
    description = "Crystal Remix is a Crystal icon theme for modern Linux desktop environments.";
    homepage = "https://github.com/dangvd/crystal-remix-icon-theme";
    license = lib.licenses.lgpl2Plus;
    platforms = lib.platforms.all;
  };
}
