{
  description = "Flake for my NixOS configuration.";
  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-23.11";
    };
    home-manager = {
      url = "home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.nhuengzii = import ./home/nhuengzii.nix;
          };
        }
      ];
    };
  };
}
