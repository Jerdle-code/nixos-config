{ config, pkgs,... }:
{
  networking.hostName = "Dimir"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
    services.pulseaudio.enable = false;
  services.logind.settings.Login.HandleLidSwitch = "ignore";
   services.printing.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  security.rtkit.enable = true;
  boot.kernel.sysctl = {"net.ipv4.ip_forward" = 1;};

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
programs.virt-manager.enable = true;

virtualisation.libvirtd.enable = true;

virtualisation.spiceUSBRedirection.enable = true;
}

