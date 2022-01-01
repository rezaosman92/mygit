# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aria2
    htop
    neofetch
    gcc
    usbutils
    autoPatchelfHook
    brave
    firefox-bin
    unrar
    gimp
    calc
    youtube-dl
    patchelf
    bash
    bashCompletion
    bashInteractive
    mpv
    p7zip
    most
    curl
    dpkg
    gnumake
    perl
    perlPackages.WWWMechanize
    perlPackages.IOHTML
    perlPackages.LWPProtocolHttps
    wget
    puddletag
    cmus
    python3
    lutris
    git
    copyq
    thunderbird-bin
    recoll
    nload
    dbeaver
    mumble
  ];

}

