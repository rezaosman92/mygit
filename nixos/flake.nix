{
  description = "reza flake for laptops and pcs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.nixos-t14 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./t14-configuration.nix ];
    };

    nixosConfigurations.nixos-intel-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./intel-pc-configuration.nix ];
    };

    nixosConfigurations.nixos-home-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./home-pc-configuration.nix ];
    };
  };
}

