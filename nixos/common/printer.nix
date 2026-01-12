{ config, pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      foomatic-filters
      gutenprint
      gutenprintBin
      epson-201401w
      epson_201207w
      # hplipWithPlugin
    ];
  };

}
