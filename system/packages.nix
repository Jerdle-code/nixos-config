{ config, pkgs,... }:
{
#nixpkgs.config.allowUnfree = true;
  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;
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
      virt-manager
      lxqt.lxqt-openssh-askpass
      lxqt.lxqt-policykit
      upower
      kdePackages.partitionmanager
      git
      kdePackages.qtwayland
      kdePackages.filelight
      glib #somehow this needs manually installing
  ];
  services.upower.enable=true;
programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
services.udisks2.enable = true;
security.polkit.enable = true;
services.flatpak.enable = true;
services.gvfs.enable = true;
  programs.zsh.enable = true;
  services.power-profiles-daemon.enable = true;
  # List services that you want to enable:
#  services.auto-cpufreq.enable = true;
#   virtualisation.virtualbox.host.enable = true;
#   virtualisation.virtualbox.host.enableExtensionPack = true;
#services.fprintd.enable = true;
fonts.packages = with pkgs; [
   noto-fonts
   lmodern
   nerdfonts
   font-awesome
   powerline
];
#services.fprintd.tod.enable = true;

#services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
  # Enable the OpenSSH daemon.
   services.openssh.enable = true;
   programs.ssh.askPassword = "lxqt-openssh-askpass";
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

services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };
}
