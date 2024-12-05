# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{


  environment.systemPackages = with pkgs; [
    acpi
    aria2
    btop
    fastfetch
    usbutils
    unrar
    calc
    bash-completion
    bashInteractive
    p7zip
    most
    curl
    wget
    git
    fzf
    lynis
    python3
    pciutils
    efibootmgr
    lazygit
    cilium-cli


    #helix and its lsp
    helix
    nil
    lldb
    #nodePackages.bash-language-server



  ];


}
  
