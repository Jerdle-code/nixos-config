# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.kernel.sysctl = { "vm.swappiness" = 10;};

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9c9a4641-ae10-476d-8a91-714029aecf77";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" ];
    };

    fileSystems."/fs" =
    { device = "/dev/disk/by-uuid/9c9a4641-ae10-476d-8a91-714029aecf77";
      fsType = "btrfs";
      options = [ "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/9c9a4641-ae10-476d-8a91-714029aecf77";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };

  fileSystems."/nix/store" =
    { device = "/dev/disk/by-uuid/9c9a4641-ae10-476d-8a91-714029aecf77";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime"];
    };

  fileSystems."/var/lib/flatpak" =
    { device = "/dev/disk/by-uuid/9c9a4641-ae10-476d-8a91-714029aecf77";
      fsType = "btrfs";
      options = [ "subvol=@flatpak" "compress=zstd" "noatime"];
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/B440-FE4B";
      fsType = "vfat";
    };

  fileSystems."/mnt/data" =
    { device = "/dev/disk/by-uuid/672bbe4d-a3ac-4ccc-beda-d77e60fe174d";
      fsType = "btrfs";
    };
  swapDevices = [{device = "/dev/disk/by-uuid/5190341d-7d3d-49f6-9daf-617cc66c758f";} ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
