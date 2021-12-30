# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, ... }:

{
  
#filesystem
  fileSystems."/" =
    { 
      fsType = "btrfs";
      options = ["subvol=@" "noatime" "compress=zstd:3" "space_cache=v2"];
    };

  fileSystems."/home" =
    { 
      fsType = "btrfs";
      options = ["subvol=@home" "noatime" "compress=zstd:3" "space_cache=v2"];
    };

  fileSystems."/var/log" =
    { 
      fsType = "btrfs";
      options = ["subvol=@var_log" "noatime" "compress=zstd:3" "space_cache=v2"];
    };
   
}

