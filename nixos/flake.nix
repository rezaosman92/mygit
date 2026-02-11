{
  description = "reza flake for laptops and pcs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs =
    { self, nixpkgs, ... }:
    {
      nixosConfigurations.nixos-hp845 = nixpkgs.lib.nixosSystem {
        # must be identical with configured hostname in main config file
        system = "x86_64-linux";
        modules = [ ./hp845/hp845-configuration.nix ];
      };

      nixosConfigurations.nixos-amdpc = nixpkgs.lib.nixosSystem {
        # must be identical with configured hostname in main config file
        system = "x86_64-linux";
        modules = [ ./amdpc/amdpc-configuration.nix ];
      };

      nixosConfigurations.nixos-t14 = nixpkgs.lib.nixosSystem {
        # must be identical with configured hostname in main config file
        system = "x86_64-linux";
        modules = [ ./t14/t14-configuration.nix ];
      };
    };
}
