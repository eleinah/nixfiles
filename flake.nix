{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
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
              inputs.dms.homeModules.dankMaterialShell.default
            ];
            users = {
              ellie = import ./users/ellie;
            };
          };
        };
      };
    in
    {
      nixosConfigurations = {
        nix-lab = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            ./common
            ./users/ellie/sys.nix
            ./hosts/lab

            home-manager.nixosModules.home-manager
            hm.ellie
          ];
        };
        mainstation = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            ./common
            ./users/ellie/sys.nix
            ./hosts/mainstation

            home-manager.nixosModules.home-manager
            hm.ellie
          ];
        };
        travelstation = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            ./common
            ./users/ellie/sys.nix
            ./hosts/travelstation

            home-manager.nixosModules.home-manager
            hm.ellie
          ];
        };
      };
    };
}
