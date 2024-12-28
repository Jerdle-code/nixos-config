{
  description = "My Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, plasma-manager, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.Boros = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
            };
      };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        Boros/system/default.nix
        Boros/daniel/programs/default.nix
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.daniel = import Boros/daniel/default.nix;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
    nixosConfigurations.Azorius = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
            };
      };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        Azorius/system/default.nix
        Azorius/daniel/programs/default.nix
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.daniel = import Azorius/daniel/default.nix;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
  };
}
