{ pkgs, ... }:
{
  # Enable the X11 windowing system.

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
  hardware.graphics = {
    enable32Bit = true; # For 32 bit applications
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };
}
