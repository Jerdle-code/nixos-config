{ ... }:
{
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 1073741824;
  };
  system.stateVersion = "25.11";
}
