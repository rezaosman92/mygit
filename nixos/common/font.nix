{ config, pkgs, ... }:

{

  fonts.packages = with pkgs; [
    liberation_ttf
    noto-fonts
    inter
    iosevka
  ];

  fonts.fontDir.enable = true;

}
