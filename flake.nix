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
              ellie = import ./users/ellie;
            };
          };
        };
      };
    in
    {
      nixosConfigurations = {
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
