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

    agenix = {
      url = "github:ryantm/agenix";
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
      homeManagerModules = import ./modules/home-manager;
      system = "x86_64-linux";
      hm = {

        ellie = {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [
              inputs.nix-doom-emacs-unstraightened.homeModule
              homeManagerModules.librepods
              homeManagerModules.helium-browser
              inputs.agenix.homeManagerModules.default
              ./secrets
            ];
            users = {
              ellie = import ./home-manager/ellie;
            };
          };
        };

      };

      myOverlays = import ./overlays { inherit inputs; };

      overlayModule =
        { config, pkgs, ... }:
        {
          nixpkgs.overlays = builtins.attrValues myOverlays;
        };
    in
    {
      packages = import ./pkgs nixpkgs.legacyPackages.${system};
      overlays = myOverlays;
      nixosModules = import ./modules/nixos;

      nixosConfigurations = {
        mainstation = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            overlayModule
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
            overlayModule
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
