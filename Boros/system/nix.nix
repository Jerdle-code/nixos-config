{ config, pkgs,... }:
{
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "23.11";
}
