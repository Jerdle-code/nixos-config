{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./packages.nix
      ./config.nix
    ];
}
