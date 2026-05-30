{
  description = "My Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        Rakdos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            # Import the previous configuration.nix we used,
            # so the old configuration file still takes effect
            Rakdos/system/default.nix
            Rakdos/daniel/programs/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.daniel = import Rakdos/daniel/default.nix;
              };
            }
          ];
        };
        Azorius = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            # Import the previous configuration.nix we used,
            # so the old configuration file still takes effect
            Azorius/configuration.nix
          ];
        };
        Golgari = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            # Import the previous configuration.nix we used,
            # so the old configuration file still takes effect
            Golgari/system/default.nix
            Golgari/daniel/programs/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.daniel = import Golgari/daniel/default.nix;
              };
            }
          ];
        };
      };
    };
}
