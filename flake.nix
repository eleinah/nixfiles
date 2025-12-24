{
  description = "NixOS configuration";
  system = "x86_64-linux";
  hm-ellie = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users = {
          ellie = import ./users/ellie.nix
        };
      };

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nix-lab = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./common.nix
          ./hosts/lab/hardware-configuration.nix
          ./hosts/lab/configuration.nix

          home-manager.nixosModules.home-manager hm-ellie
        ];
      };
      mainstation = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./common.nix
          ./hosts/mainstation/hardware-configuration.nix
          ./hosts/mainstation/configuration.nix

          home-manager.nixosModules.home-manager hm-ellie
        ];
      };
      travelstation = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./common.nix
          ./hosts/travelstation/hardware-configuration.nix
          ./hosts/travelstation/configuration.nix

          home-manager.nixosModules.home-manager hm-ellie
        ];
      };
    };
  };
}
