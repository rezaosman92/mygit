{ config, ...  }:

{

  imports =
    [ # Include the results of the hardware scan.
      <nixpkgs/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix>
    ];
  
  hardware = {
    sane = {
      enable = true;
      brscan4 = {
        enable = true;
        netDevices = {
          home = {
            model = "MFC-L2700DN";
            ip = "192.168.178.23";
          };
        };
      };
    };
  };

}
