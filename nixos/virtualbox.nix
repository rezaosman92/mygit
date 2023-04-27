{ config, pkgs, ...  }:

{

nixpkgs.config.allowUnfree = true;

virtualisation.virtualbox.host = {
  enable = true;
  enableExtensionPack = true;

};

}
