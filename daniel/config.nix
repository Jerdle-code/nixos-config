{ config, pkgs, lib, ... }:
{
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";
  home.sessionVariables = {
    EDITOR = "nano";
    QT_QPA_PLATFORMTHEME = "kde";
  };

#   services.gammastep = {
#     enable = true;
#     dawnTime = "08:00";
#     duskTime = "22:00";
#     temperature = {
#       day = 6500;
#       night = 3700;
#     };
#   };
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
#   services.mako = {
#     enable = true;
#     defaultTimeout = 4000;
#     backgroundColor = "#2a2e32";
#     borderRadius = 20;
#     font = "monospace 12";
#     padding = "10";
#     height = 300;
#     width = 500;
#   };
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
