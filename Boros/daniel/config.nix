{ config, pkgs, lib, ... }:
{
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";
  home.sessionVariables = {
    EDITOR = "nano";
  };
programs.git = {
    enable = true;
      userName = "Jerdle-code";
      userEmail = "danielamdurer@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
