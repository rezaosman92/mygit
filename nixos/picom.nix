{ config, ... }:

{

services.picom ={
    enable = true;
    backend = "glx";
    vSync = true;
    fade = true;
    fadeSteps = [ 0.03 0.02 ];
    fadeDelta = 5;
    shadow = true;
    shadowOffsets = [ (-8) (-8) ];
    wintypes = {
      "popup_menu" = { "opacity" = 0.9; };
      "normal" = { "blur-background" = true;};
    };

    settings = {
      shadow-radius = 8;
      shadow-red = 0;
      shadow-green = 71;
      shadow-blue = 234;
      shadow-exclude = [
        "name = 'Notification'"
        "class_g = 'Conky'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Cairo-clock'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      blur =
        { method = "dual-kawase";
          size = 10;
        };
    };

};

}
