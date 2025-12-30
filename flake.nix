{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOs/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      hm = {

        ellie = {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [
              inputs.nix-doom-emacs-unstraightened.homeModule
            ];
            users = {
              ellie = import ./home-manager/ellie;
            };
          };
        };

      };
    in
    {
      packages = import ./pkgs nixpkgs.legacyPackages.${system};
      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        mainstation = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            ./hosts/common
            ./hosts/mainstation
            ./home-manager/ellie/sys.nix

            home-manager.nixosModules.home-manager
            hm.ellie
          ];
        };
        travelstation = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            ./hosts/common
            ./hosts/travelstation
            ./home-manager/ellie/sys.nix

            home-manager.nixosModules.home-manager
            hm.ellie
          ];
        };
        boxoffice = nixpkgs-stable.lib.nixosSystem {
          inherit system;
          modules = [
            ./servers/common
            ./servers/boxoffice
          ];
        };
      };
    };
}
