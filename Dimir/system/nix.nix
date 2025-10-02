{ config, pkgs,... }:
{
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.download-buffer-size = 4294967296;
  system.stateVersion = "23.11";
}
