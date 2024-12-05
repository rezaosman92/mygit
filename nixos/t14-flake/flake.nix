{
  description = "flake for t14";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {

   nixosConfigurations.nixos-t14 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./t14-configuration.nix ];


  };

};

}