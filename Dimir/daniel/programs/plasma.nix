{ config, pkgs, lib, ... }:
{
  options = {
    local.daniel.desktop.plasma.enable = lib.mkEnableOption ''
      Customised Plasma 6 desktop.
    '';
  };
  config = lib.mkIf config.local.daniel.desktop.plasma.enable {
    services.desktopManager.plasma6.enable = true;
        home-manager.users.daniel.home.packages = (with pkgs.kdePackages; [
        yakuake
        ]);
          home-manager.users.daniel.qt = {
  enable = true;
      platformTheme.package = with pkgs.kdePackages; [
        plasma-integration
        systemsettings
    ];
#  platformTheme.name = "kde";
  style.name = "kvantum";
};
home-manager.users.daniel.systemd.user.sessionVariables = { QT_QPA_PLATFORMTHEME = lib.mkForce "kde"; };
home-manager.users.daniel.programs.plasma = {
    enable = true;
};
}
