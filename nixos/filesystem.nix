
{ config, ... }:

{
  
  fileSystems."/" =
    { 
      fsType = "btrfs";
      options = ["subvol=@" "noatime" "compress=zstd:3" "space_cache=v2"];
      mountPoint = "/";
    };

  fileSystems."/home" =
    { 
      fsType = "btrfs";
      options = ["subvol=@home" "noatime" "compress=zstd:3" "space_cache=v2"];
      mountPoint = "/home";
    };

  fileSystems."/var_log" =
    { 
      fsType = "btrfs";
      options = ["subvol=@var_log" "noatime" "compress=zstd:3" "space_cache=v2"];
      mountPoint = "/var/log";
    };

  fileSystems."/boot" =
    { 
      fsType = "vfat";
      mountPoint = "/boot";
    };

  
}

