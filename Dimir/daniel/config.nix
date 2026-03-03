{ config, pkgs, lib, ... }:
{
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";
  home.sessionVariables = {
    EDITOR = "emacs";
  };
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Jerdle-code";
        email = "danielamdurer@gmail.com";
      };
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
    package = pkgs.emacs-gtk;
    extraConfig = '' '';
  };
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
