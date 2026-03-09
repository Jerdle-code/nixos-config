{pkgs, ... }:
{
  # Bootloader.
  boot.loader = {
    limine = {
      enable = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  environment.systemPackages = [pkgs.sbctl];
}
