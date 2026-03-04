{ ... }:
{
  networking.hostName = "Dimir"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;
  services.pulseaudio.enable = false;
  services.printing.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  security.rtkit.enable = true;
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

  };
  programs.virt-manager.enable = true;

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
