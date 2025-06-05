{
  description = "reza flake for laptops and pcs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.nixos-hp845 = nixpkgs.lib.nixosSystem { #must be same with configured hostname in main config file
      system = "x86_64-linux";
      modules = [ ./hp845/hp845-configuration.nix ];
    };

    nixosConfigurations.nixos-amdpc = nixpkgs.lib.nixosSystem { #must be same with configured hostname in main config file
     system = "x86_64-linux";
     modules = [ ./amd-pc/amdpc-configuration.nix ];
   };
  };
}

