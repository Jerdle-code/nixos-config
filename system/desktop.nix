{ config, pkgs,... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.displayManager.sddm = {
  enable = true;
  extraPackages = [pkgs.sddm-chili-theme];
  wayland.enable = true;
  theme = "sddm-chili";
  };
hardware.graphics.extraPackages = with pkgs; [
  rocmPackages.clr.icd
];
hardware.graphics.enable32Bit = true; # For 32 bit applications
}
