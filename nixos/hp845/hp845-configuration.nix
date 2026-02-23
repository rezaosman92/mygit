# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.

    # core system
    ./hardware-configuration.nix
    # ./../common/nix-ld.nix
    ./../common/nix-pm.nix
    ./../common/env.nix
    ./../filesystem/btrfs2.nix
    ./../common/bootsysd.nix
    ./../common/gpu-amd.nix
    ./../common/audio.nix
    ./../common/user.nix
    ./../common/localeandtime.nix
    ./../common/font.nix

    # desktop environment or window manager
    ./../de/de-gnome.nix

    # networking
    ./../common/firewall.nix
    # ./../common/cloudflare-warp.nix
    ./../common/dnscrypt-proxy.nix

    # virtualization
    # ./../common/virtualbox-host.nix

    # shell
    ./../common/fish.nix

    # peripherals
    ./../common/printer.nix
    #./../common/scanner.nix

    # packages and tools
    ./../common/packageandservice.nix
    ./../common/foot.nix
    ./../common/helix.nix

  ];

  hardware.cpu.amd.updateMicrocode = true;
  # hardware.cpu.intel.updateMicrocode = true;
  hardware.bluetooth.enable = true;

  powerManagement.cpuFreqGovernor = "performance";

  networking.hostName = "nixos-hp845";

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
