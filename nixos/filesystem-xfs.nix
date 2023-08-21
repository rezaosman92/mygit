
{ config, ... }:

{
  
  fileSystems."/" =
    { 
      fsType = "xfs";
      options = [ "defaults" "noatime" "rw" ];
      mountPoint = "/";
    };

  fileSystems."/boot" =
    {
      fsType = "vfat";
      mountPoint = "/boot";
    };

  
}

