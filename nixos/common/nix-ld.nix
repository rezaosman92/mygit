{ config, pkgs, ... }:

{

  programs.nix-ld = {
    #to run unpatched binaries in nixos by exposing shlibs
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse3
      icu
      nss
      openssl
      curl
      expat
    ];
  };

}
