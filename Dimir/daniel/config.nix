{
  pkgs,
  ...
}:
{
  home = {
  username = "daniel";
  homeDirectory = "/home/daniel";
  sessionVariables = {
    EDITOR = "emacs";
  };
  stateVersion = "23.11";
  };
  programs = {git = {
    enable = true;
    settings = {
      user = {
        name = "Jerdle-code";
        email = "danielamdurer@gmail.com";
      };
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
  zsh = {
    enable = true;
    initContent = "fastfetch";
    enableVteIntegration = true;
    oh-my-zsh = {
      enable = true;
      theme = "tjkirch";
    };
  };
  emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraConfig = "";
  };
  home-manager.enable = true;
  };

}
