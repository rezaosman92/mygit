{
  description = "flake for amd-pc";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {

   nixosConfigurations.nixos-amd-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./amd-pc-configuration.nix ];


  };

};

}
