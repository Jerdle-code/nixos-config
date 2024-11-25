{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./private.nix
      ./packages.nix
      ./config.nix
    ];
}
