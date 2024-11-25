{ config, pkgs,... }:

{
users.users = {
   daniel = {
      isNormalUser = true;
      description = "Daniel Amdurer";
      group = "users";
      home = "/home/daniel";
      uid = 1000;
      extraGroups  = [ "wheel" "networkmanager" "libvirtd" "input"];
      shell = pkgs.zsh;
   };
};
}
