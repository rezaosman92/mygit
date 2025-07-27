{ config, pkgs, ... }:

{

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 2";
    flake = "/home/$USER/mygit/nixos/";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.settings.auto-optimise-store = true;

  nix.extraOptions = ''experimental-features = nix-command flakes '';

  system.rebuild.enableNg = true;

}
