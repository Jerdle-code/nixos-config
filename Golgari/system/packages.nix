{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    nix-search-cli
    upower
    git
    lua
    lxqt.lxqt-openssh-askpass
    lxqt.lxqt-policykit
    chromium
  ];
  security.polkit.enable = true;
  services = {
    upower.enable = true;
    udisks2.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    openssh.enable = true;
  };
  xdg.portal = {enable = true; extraPortals = [pkgs.xdg-desktop-portal-gtk];};
  ssh.askPassword = "lxqt-openssh-askpass";
  
  fonts.packages =
    with pkgs;
    [
      noto-fonts
      lmodern
      font-awesome
      powerline
    ]
  programs = {
    dconf.enable = true;
    zsh.enable = true;
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
    chromium = {
      enable = true;
      extensions = ["ddkjiahejlhfcafbddmgiahcphecmpfh"];
    };
  };
}
