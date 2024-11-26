# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./de-gnome.nix
      ./filesystem-btrfs.nix
      ./gpu-amd.nix
      ./t14-packages.nix
      ./printer.nix
      #./scanner.nix
      ./systemd-resolved.nix
      ./virtualbox-host.nix
    ];

  hardware.cpu.amd.updateMicrocode = true;
  hardware.graphics = {
    enable = true;
    #driSupport32Bit = true;
  };

  zramSwap.enable = true;

  services.fwupd.enable = true;
  services.colord.enable = true;

  #services.tlp.enable= true;


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_6_6;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelParams = [ "acpi_backlight=native" ];
  
  
  networking.hostName = "nixos-t14"; 
  networking.networkmanager.enable = true;

  

# Set your time zone.
  time.timeZone = "Asia/Jakarta";


# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "en_GB.UTF-8/UTF-8" 
    "id_ID.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
    LC_ALL = "en_GB.UTF-8";

    
  };

  
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  services.xserver.xkb.layout="us";


  hardware.bluetooth.enable = true;

  xdg.portal = {
    enable = true;
  };

    
  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

#  services.fstrim.enable = true;

  services.earlyoom = {
    enable = true;
    enableDebugInfo = true;
    enableNotifications = true;
  };

  services.libinput.enable = true;

  users.users.reza = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" "libvirtd" "scanner" "lp" "vboxusers" ];
    description = "Reza Maulana";
  };

  programs.nh.enable = true;

  programs.fish = {
    enable = true;  
  };

  users.defaultUserShell = pkgs.fish;

  programs.tmux.enable = true;

  #programs.gamescope.enable = true;
  programs.gamemode.enable = true;

#  services.emacs = {
#    enable = true;
#    defaultEditor = true;
#    package = pkgs.emacs-nox;
#  };

  services.flatpak.enable = true;
  fonts.fontDir.enable = true;


  nixpkgs.config = {
    allowUnfree = true;
    };

  nix.settings.auto-optimise-store = true;
  
  nix.extraOptions = ''
  experimental-features = nix-command flakes
                   '';

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  environment = {
    shellAliases = {
      "ec" = "emacsclient -t";
      "most" = "most -w";
    };
  
    variables = {
      PAGER = "most -w";

    };

  };
    
  fonts.packages = with pkgs; [
    liberation_ttf
    noto-fonts
    fira
    fira-code
    inter
  ];

  programs.adb.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.allowSFTP = true;
  programs.mosh.enable = true;

  
  networking = { 
    firewall = { 
      enable = true;
      #allowedTCPPorts = [ 80 443 ];
      #allowedUDPPorts = [ 51215 ];
      #allowedUDPPortRanges = [
      #  { from = 4000; to = 4007; }
      #  { from = 8000; to = 8010; }
      #  ];
      };
    nftables.enable = true;
  };


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  #system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}


