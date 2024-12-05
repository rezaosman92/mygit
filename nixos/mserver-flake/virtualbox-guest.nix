{ config, pkgs, ...  }:

{

virtualisation.virtualbox.guest = {
    enable = true;
    seamless = true;
    draganddrop = true;
    clipboard = true;
    
};

}
