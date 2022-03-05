
{ config, ... }:

{
  
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

  fileSystems."/boot" =
    { 
      fsType = "vfat";

    };

  
}

