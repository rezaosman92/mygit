# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  environment.systemPackages = with pkgs; [

    zellij

    #helix and its barebones lsp
    helix

    nixd
    nixpkgs-fmt
    nixfmt-rfc-style

  ];

}
