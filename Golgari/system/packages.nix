{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    nix-search-cli
    upower
    git
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
  fonts.packages =
    with pkgs;
    [
      noto-fonts
      lmodern
      font-awesome
      powerline
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  programs = {
    dconf.enable = true;
    zsh.enable = true;
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
  };
}
