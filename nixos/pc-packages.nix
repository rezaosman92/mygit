# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


  let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; };  };
  in {
    environment.systemPackages = with pkgs; [
      aria2
      htop
      neofetch
      gcc
      usbutils
      autoPatchelfHook
      brave
      dmidecode
      ffmpeg
      unrar
      rar
      gimp
      calc
      yt-dlp
      ytmdl
      patchelf
      bash
      bash-completion
      bashInteractive
      mpv
      p7zip
      most
      curl
      dpkg
      gnumake
      perl
      wget
      puddletag
      cmus
      python3
      git
      copyq
      nload
      mumble
      transmission-gtk
      cloudflare-warp
      lutris
      recoll
      genymotion
      rssguard
      virt-manager
      #unstable.openai-whisper
      #firefox

    ];

  }

    
