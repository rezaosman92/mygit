# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../de/de-gnome.nix
    ./../filesystem/btrfs.nix
    ./../common/boot.nix
    ./../common/gpu-amd.nix
    ./../common/package.nix
    ./../common/printer.nix
    #./../common/scanner.nix
    ./../common/cloudflare-warp.nix
    ./../common/dnscrypt-proxy.nix
    # ./../common/virtualbox-host.nix
    ./../common/foot.nix
    ./../common/helix.nix
    ./../common/audio.nix
    ./../common/user.nix
    ./../common/firewall.nix
    ./../common/localeandtime.nix
    # ./../common/nix-ld.nix
  ];

  hardware.cpu.amd.updateMicrocode = true;
  # hardware.cpu.intel.updateMicrocode = true;

  zramSwap.enable = true;

  system.rebuild.enableNg = true;
  boot.initrd.compressor = "zstd";
  hardware.firmwareCompression = "zstd";
  powerManagement.cpuFreqGovernor = "performance";

  services.fwupd.enable = true;
  services.colord.enable = true;

  networking.hostName = "nixos-hp845";
  networking.networkmanager.enable = true;

  console = {
    useXkbConfig = true; # use xkbOptions in tty.
  };

  services.xserver.xkb.layout = "us";

  # hardware.bluetooth.enable = true;

  xdg.portal = {
    enable = true;
  };

  services.earlyoom = {
    enable = true;
    enableDebugInfo = true;
    enableNotifications = true;
  };

  services.libinput.enable = true;


  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 2";
    flake = "/home/$USER/mygit/nixos/";
  };

  programs.fish = {
    enable = true;
  };

  users.defaultUserShell = pkgs.fish;

  services.flatpak.enable = true;
  fonts.fontDir.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.settings.auto-optimise-store = true;

  nix.extraOptions = ''experimental-features = nix-command flakes '';

  environment = {
    shellAliases = {
      # "ec" = "emacsclient -t";
      "most" = "most -w";
    };

    variables = {
      PAGER = "most -w";

    };

  };

  fonts.packages = with pkgs; [
    liberation_ttf
    noto-fonts
    inter
    iosevka
  ];

  programs.adb.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
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
  system.stateVersion = "25.05"; # Did you read the comment?

}
