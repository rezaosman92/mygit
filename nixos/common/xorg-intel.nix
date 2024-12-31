{ config, ... }:

{

  services.xserver.config =

    ''

  Section "Device"
    Option "DRI" "False"  
    Option "NoAccel" "True"
    Identifier "Intel Graphics"
    Driver "intel"
    EndSection

    '';
  
}
