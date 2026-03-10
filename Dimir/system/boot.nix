{pkgs, ... }:
{
  # Bootloader.
  boot.loader = {
    limine = {
      enable = true;
      secureBoot.enable = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  environment.systemPackages = [pkgs.sbctl];
}
