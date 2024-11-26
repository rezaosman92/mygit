{
  description = "flake for t14";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }@attrs: {

   nixosConfigurations.nixos-t14 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./t14-configuration.nix ];

    };

  };
}
