# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };

  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    bottles
    acpi
    tlp
    btop
    fastfetch
    usbutils
    brave
    ffmpeg-full
    unrar
    calc
    yt-dlp
    bash
    bash-completion
    bashInteractive
    mpv
    p7zip
    most
    curl
    wget2
    puddletag
    cmus
    git
    nload
    nmap
    pdfarranger
    woeusb-ng
    fzf
    lynis
    lm_sensors
    python3
    audacity
    pciutils
    sysbench
    libreoffice
    obs-studio
    vulkan-tools
    firefox
    #cloudflare-warp
    krita
    efibootmgr
    mumble
    lazygit
    #whisper-ctranslate2


    #helix and its lsp
    helix
    nil
    lldb
    #nodePackages.bash-language-server


    #learn rust
    #clang
    #llvmPackages.bintools
    #rustup    
    #cargo
    #rustc
    #rust-analyzer
    #rustfmt


  ];


}
  
