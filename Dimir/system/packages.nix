{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    winetricks
    wineWowPackages.full
    nix-search-cli
    mesa-demos
    clinfo
    vulkan-tools
    links2
    tmux
    jdk21
    lxqt.lxqt-openssh-askpass
    lxqt.lxqt-policykit
    upower
    git
    kdePackages.qtwayland
    kdePackages.filelight
    kdePackages.plasma-thunderbolt
    dive # look into docker image layers
    podman-tui # status of containers in the terminal
    podman-compose # start group of containers for dev
    distrobox
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
  # Enable the OpenSSH daemon.
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  programs = {
    dconf.enable = true;
    ssh.askPassword = "lxqt-openssh-askpass";
    kdeconnect.enable = true;
    partition-manager.enable = true;
    zsh.enable = true;
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
  };
}
