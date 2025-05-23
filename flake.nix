{
  description = "My Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    portainer-on-nixos.url = "gitlab:cbleslie/portainer-on-nixos";
    portainer-on-nixos.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, portainer-on-nixos, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.Dimir = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        Dimir/system/default.nix
        Dimir/daniel/programs/default.nix
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.daniel = import Dimir/daniel/default.nix;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
    nixosConfigurations.Azorius = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
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
        portainer-on-nixos.nixosModules.portainer
        {
          services.portainer = {
            enable = true; # Default false

            version = "latest"; # Default latest, you can check dockerhub for
                                # other tags.

            openFirewall = true; # Default false, set to 'true' if you want
                                    # to be able to access via the port on
                                    # something other than localhost.

            port = 9443; # Sets the port number in both the firewall and
                         # the docker container port mapping itself.
          };
        }
      ];
    };
  };
}
