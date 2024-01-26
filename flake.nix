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
    nvim = {
      url = "github:Nhuengzii/nixvim-config";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvim,... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree= true; };
    nvim' = nvim.packages.${system}.default;
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.nhuengzii = import ./home/nhuengzii.nix { inherit pkgs; nvim = nvim';};
          };
        }
      ];
    };

    packages.${system}.setup-astronvim = pkgs.writeShellScriptBin "setup-astronvim" ''
      mv ~/.config/nvim ~/.config/nvim.bak
      ${pkgs.git}/bin/git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
      ${pkgs.git}/bin/git clone https://github.com/Nhuengzii/astronvim-config.git ~/.config/nvim/lua/user
    '';
  };
}
