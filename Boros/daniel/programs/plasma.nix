{ config, pkgs, lib, ... }:
{
  options = {
    local.daniel.desktop.plasma.enable = lib.mkEnableOption ''
      Customised Plasma 6 desktop.
    '';
  };
  config = lib.mkIf config.local.daniel.desktop.plasma.enable {
    services.desktopManager.plasma6.enable = true;
        home-manager.users.daniel.home.packages = (with pkgs.kdePackages; [
        yakuake
        ]);
  programs.plasma = {
    enable = true;
    shortcuts = {
      "services/org.kde.konsole.desktop"."_launch" = ["Ctrl+Alt+T" "Meta+Return"];
      "yakuake"."toggle-window-state" = "F8,F12,Open/Retract Yakuake";
    };
    configFile = {
      "kcminputrc"."Mouse"."cursorTheme" = "Night Diamond (Blue)";
      "kded5rc"."Module-browserintegrationreminder"."autoload" = true;
      "kded5rc"."Module-device_automounter"."autoload" = true;
      "kdeglobals"."DirSelect Dialog"."DirSelectDialog Size" = "824,579";
      "kdeglobals"."General"."LastUsedCustomAccentColor" = "212,175,55";
      "kdeglobals"."General"."XftHintStyle" = "hintslight";
      "kdeglobals"."General"."XftSubPixel" = "none";
      "kdeglobals"."General"."fixed" = "Latin Modern Mono,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,12 Regular";
      "kdeglobals"."General"."font" = "Latin Modern Sans,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,12 Regular";
      "kdeglobals"."General"."menuFont" = "Latin Modern Sans,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,12 Regular";
      "kdeglobals"."General"."smallestReadableFont" = "Latin Modern Sans,9,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,12 Regular";
      "kdeglobals"."General"."toolBarFont" = "Latin Modern Sans,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,12 Regular";
      "kdeglobals"."Icons"."Theme" = "crystal-remix";
      "kdeglobals"."KDE"."widgetStyle" = "kvantum-dark";
      "kdeglobals"."KFileDialog Settings"."Allow Expansion" = false;
      "kdeglobals"."KFileDialog Settings"."Automatically select filename extension" = true;
      "kdeglobals"."KFileDialog Settings"."Breadcrumb Navigation" = true;
      "kdeglobals"."KFileDialog Settings"."Decoration position" = 2;
      "kdeglobals"."KFileDialog Settings"."LocationCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."PathCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."Show Bookmarks" = false;
      "kdeglobals"."KFileDialog Settings"."Show Full Path" = false;
      "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
      "kdeglobals"."KFileDialog Settings"."Show Preview" = false;
      "kdeglobals"."KFileDialog Settings"."Show Speedbar" = true;
      "kdeglobals"."KFileDialog Settings"."Show hidden files" = true;
      "kdeglobals"."KFileDialog Settings"."Sort by" = "Size";
      "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
      "kdeglobals"."KFileDialog Settings"."Sort hidden files last" = true;
      "kdeglobals"."KFileDialog Settings"."Sort reversed" = false;
      "kdeglobals"."KFileDialog Settings"."Speedbar Width" = 140;
      "kdeglobals"."KFileDialog Settings"."View Style" = "DetailTree";
      "kdeglobals"."KShortcutsDialog Settings"."Dialog Size" = "600,480";
      "kdeglobals"."WM"."activeBackground" = "65,142,220";
      "kdeglobals"."WM"."activeBlend" = "0,0,0";
      "kdeglobals"."WM"."activeFont" = "Latin Modern Sans,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,12 Regular";
      "kdeglobals"."WM"."activeForeground" = "255,255,255";
      "kdeglobals"."WM"."inactiveBackground" = "157,170,186";
      "kdeglobals"."WM"."inactiveBlend" = "0,0,0";
      "kdeglobals"."WM"."inactiveForeground" = "65,142,220";
      "kiorc"."Confirmations"."ConfirmDelete" = false;
      "kscreenlockerrc"."Greeter"."WallpaperPlugin" = "online.knowmad.shaderwallpaper";
      "kscreenlockerrc"."Greeter/Wallpaper/online.knowmad.shaderwallpaper/General"."iChannel3_flag" = true;
      "kscreenlockerrc"."Greeter/Wallpaper/online.knowmad.shaderwallpaper/General"."pauseMode" = 3;
      "kscreenlockerrc"."Greeter/Wallpaper/online.knowmad.shaderwallpaper/General"."selectedShaderIndex" = 44;
      "kscreenlockerrc"."Greeter/Wallpaper/online.knowmad.shaderwallpaper/General"."selectedShaderPath" = "file:///home/daniel/.local/share/plasma/wallpapers/online.knowmad.shaderwallpaper/contents/ui/Shaders6/Fractal_Flythrough.frag.qsb";
      "kscreenlockerrc"."Greeter/Wallpaper/online.knowmad.shaderwallpaper/General"."shaderSpeed" = 0.1;
      "kscreenlockerrc"."Greeter/Wallpaper/org.kde.image/General"."Image" = "/nix/store/9yqjlzx1cbl5jvjwrbm9kv60q2s01v1i-plasma-workspace-wallpapers-6.2.3/share/wallpapers/Elarun/";
      "kscreenlockerrc"."Greeter/Wallpaper/org.kde.image/General"."PreviewImage" = "/nix/store/9yqjlzx1cbl5jvjwrbm9kv60q2s01v1i-plasma-workspace-wallpapers-6.2.3/share/wallpapers/Elarun/";
      "ksmserverrc"."General"."loginMode" = "emptySession";
      "ksplashrc"."KSplash"."Engine" = "KSplashQML";
      "ksplashrc"."KSplash"."Theme" = "Goldy-Splash-6";
      "kwalletrc"."Wallet"."First Use" = false;
      "kwinrc"."Compositing"."AllowTearing" = false;
      "kwinrc"."Desktops"."Id_1" = "d94ce38b-62e2-439d-ab67-1a89263d25bd";
      "kwinrc"."Desktops"."Number" = 1;
      "kwinrc"."Desktops"."Rows" = 1;
      "kwinrc"."Effect-wobblywindows"."Drag" = 90;
      "kwinrc"."Effect-wobblywindows"."Stiffness" = 6;
      "kwinrc"."Effect-wobblywindows"."WobblynessLevel" = 2;
      "kwinrc"."NightColor"."Active" = true;
      "kwinrc"."NightColor"."EveningBeginFixed" = 2200;
      "kwinrc"."NightColor"."Mode" = "Times";
      "kwinrc"."NightColor"."MorningBeginFixed" = 0800;
      "kwinrc"."NightColor"."TransitionTime" = 15;
      "kwinrc"."Plugins"."blurEnabled" = true;
      "kwinrc"."Plugins"."contrastEnabled" = true;
      "kwinrc"."Plugins"."cubeEnabled" = true;
      "kwinrc"."Plugins"."dimscreenEnabled" = true;
      "kwinrc"."Plugins"."kwin6_effect_hexagonEnabled" = true;
      "kwinrc"."Plugins"."magiclampEnabled" = true;
      "kwinrc"."Plugins"."scaleEnabled" = false;
      "kwinrc"."Plugins"."sheetEnabled" = true;
      "kwinrc"."Plugins"."squashEnabled" = false;
      "kwinrc"."Plugins"."translucencyEnabled" = true;
      "kwinrc"."Plugins"."wobblywindowsEnabled" = true;
      "kwinrc"."TabBox"."LayoutName" = "flipswitch";
      "kwinrc"."Windows"."AutoRaise" = true;
      "kwinrc"."Xwayland"."Scale" = 1;
      "kwinrc"."org.kde.kdecoration2"."BorderSize" = "Normal";
      "kwinrc"."org.kde.kdecoration2"."theme" = "__aurorae__svg__nightglowblue";
      "plasma-localerc"."Formats"."LANG" = "en_GB.UTF-8";
      "plasmaparc"."General"."GlobalMute" = true;
      "plasmarc"."Theme"."name" = "darkcold";
      "plasmarc"."Wallpapers"."usersWallpapers" = "/mnt/data/Downloads/wp2532976-night-mountain-wallpapers.jpg,/mnt/data/Documents/BG.png,/mnt/data/Documents/dark_bg_maze.png,/mnt/data/Documents/nixos-hex-bg.png";
    };
    dataFile = {
      "dolphin/view_properties/global/.directory"."Settings"."HiddenFilesShown" = true;
      "kate/anonymous.katesession"."Kate Plugins"."cmaketoolsplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."compilerexplorer" = false;
      "kate/anonymous.katesession"."Kate Plugins"."eslintplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."externaltoolsplugin" = true;
      "kate/anonymous.katesession"."Kate Plugins"."formatplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katebacktracebrowserplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katebuildplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katecloseexceptplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katecolorpickerplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katectagsplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katefilebrowserplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katefiletreeplugin" = true;
      "kate/anonymous.katesession"."Kate Plugins"."kategdbplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."kategitblameplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katekonsoleplugin" = true;
      "kate/anonymous.katesession"."Kate Plugins"."kateprojectplugin" = true;
      "kate/anonymous.katesession"."Kate Plugins"."katereplicodeplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katesearchplugin" = true;
      "kate/anonymous.katesession"."Kate Plugins"."katesnippetsplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katesqlplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katesymbolviewerplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katexmlcheckplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."katexmltoolsplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."keyboardmacrosplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."ktexteditorpreviewplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."latexcompletionplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."lspclientplugin" = true;
      "kate/anonymous.katesession"."Kate Plugins"."openlinkplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."rainbowparens" = false;
      "kate/anonymous.katesession"."Kate Plugins"."rbqlplugin" = false;
      "kate/anonymous.katesession"."Kate Plugins"."tabswitcherplugin" = true;
      "kate/anonymous.katesession"."Kate Plugins"."textfilterplugin" = true;
    };
    };
  };
}
