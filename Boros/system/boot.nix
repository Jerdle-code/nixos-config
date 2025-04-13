{ config, pkgs,... }:
{
  # Bootloader.
boot.loader.systemd-boot.enable = true;
#boot.loader.grub = {
#enable = true;
#efiSupport = true;
#device = "nodev";
#useOSProber = true;
#};
  boot.loader.efi.canTouchEfiVariables = true;
boot.loader.efi.efiSysMountPoint = "/boot/efi";
boot.kernel.sysctl = {"net.ipv4.ip_forward" = 1; "vm.swappiness" = 10;};
boot.kernelPackages = pkgs.linuxPackages_latest;
}
