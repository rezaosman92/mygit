{ config, pkgs, ...}:

{
programs.virt-manager.enable = true;

virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
};


 environment.systemPackages = with pkgs; [
    iproute2
  ];

#networking.bridges.bridge1.interfaces = [ "wlp3s0" ];
#networking.interfaces.bridge1 = {
#    useDHCP = false;
#    ipv4.addresses = [ {
#        "address" = "192.168.3.70";
#        "prefixLength" = 24;
#    }];
#};
  
}
