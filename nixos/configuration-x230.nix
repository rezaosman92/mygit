# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./filesystem.nix
      ./packages-laptop.nix
      ./de-xfce.nix
      ./libvirtd.nix
      #./wordpress.nix
    ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  zramSwap.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_5_15;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos-x230"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking = {
#    networkmanager.dns = "systemd-resolved";
    networkmanager.enable = true;
#    nameservers = ["9.9.9.9"];
  };

#  services.resolved = {
#    enable = true;
#    dnssec = "true";
#    fallbackDns = ["149.112.112.112"];
#    extraConfig = "
#                  DNSOverTLS=yes
#                  ";
#  };
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    package = pkgs.emacs-nox;
  };

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      foomatic-filters
      gutenprint
      gutenprintBin
#      epson-201401w
      epson_201207w
    ];
  };
     
#  hardware.sane.enable = true;
       
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
  };
    
  # Enable sound.
  # hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  
  hardware.pulseaudio.enable = false;
    
  services.fstrim.enable = true;
  services.gvfs.enable = true;

  services.earlyoom = {
    enable = true;
    enableDebugInfo = true;
    enableNotifications = true;
  };

  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reza = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" "libvirtd" "scanner" ];
    description = "Reza Maulana";
  };

  users.defaultUserShell = pkgs.fish;

  nixpkgs.config = {
    allowUnfree = true;
    };

  environment = {
    shellAliases = {
      "ec" = "emacsclient -t";
      "most" = "most -w";
    };
  
    variables = {
      PAGER = "most -w";
      MOZ_ENABLE_WAYLAND = "1";

    };

  };
    
  fonts.fonts = with pkgs; [
    liberation_ttf
    noto-fonts
    hack-font
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.fish = {
    enable = true;  
  };
  
  programs.droidcam.enable = true;
  programs.adb.enable = true;

#  programs.java = {
#    enable = true;
#    package = pkgs.openjdk11;
#  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?


}

