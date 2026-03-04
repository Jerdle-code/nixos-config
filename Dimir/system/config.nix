{ ... }:
{
  networking = {
    hostName = "Dimir"; # Define your hostname.
    networkmanager.enable = true;
  };
  services = {
    pulseaudio.enable = false;
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;

    };
  };
  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = true;
  };
  security.rtkit.enable = true;
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
  };

  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
}
