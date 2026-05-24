{ pkgs, ... }:

{
  users.users = {
    daniel = {
      isNormalUser = true;
      description = "Daniel Amdurer";
      group = "users";
      home = "/home/daniel";
      uid = 1000;
      extraGroups = [
        "wheel"
        "networkmanager"
        "libvirtd"
        "input"
        "podman"
      ];
      shell = pkgs.zsh;
    };
    guest = {
      isNormalUser = true;
      description = "Guest User";
      group = "users";
      home = "/home/guest";
      uid = 1001;
      extraGroups = [
        "networkmanager"
        "libvirtd"
        "input"
      ];
      shell = pkgs.zsh;
    };
  };
}
