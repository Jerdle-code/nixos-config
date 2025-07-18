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
  programs.zsh = {
    enable = true;
    initContent = "fastfetch";
    enableVteIntegration = true;
    oh-my-zsh = {
        enable = true;
        theme = "tjkirch";
    };
  };
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
    extraConfig = '' '';
  };
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
