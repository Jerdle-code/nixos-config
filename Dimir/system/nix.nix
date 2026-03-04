{ ... }:
{
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 4294967296;
  };
  system.stateVersion = "23.11";
}
