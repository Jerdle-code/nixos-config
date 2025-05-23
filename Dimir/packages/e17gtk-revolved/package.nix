{lib, stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "e17gtk-revolved";
  version = "git";

  src = fetchgit {
    url = "https://git.disroot.org/eudaimon/E17gtk-revolved";
    rev = "2217140ec82dc0cf10340d8490a3ca23d1567577";
    hash = "sha256-RiwraD7ou6MRQbP/BvwkV3djU+O+/wjwHjeV16AUotw=";
  };

  installPhase = ''
    mkdir -p $out/share/{doc,themes}/E17gtk-revolved
    cp -va index.theme gtk-2.0 gtk-3.0 gtk-4.0 metacity-1 xfwm4 $out/share/themes/E17gtk-revolved/
    cp -va README.md WORKAROUNDS screenshot.jpg $out/share/doc/E17gtk-revolved/
  '';

  meta = {
    description = "Enlightenment-like GTK theme with sharp corners (Revolved version). Fork of E17gtk";
    homepage = "https://git.disroot.org/eudaimon/E17gtk-revolved";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
  };
}
