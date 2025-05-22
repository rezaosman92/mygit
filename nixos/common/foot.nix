{config, ...}:

{
programs.foot = {
    enable = true;
    theme = "modus_operandi";

    
    settings = 
        {
          main = {
              font = "AdwaitaMono:style=Bold:size=12";
              box-drawing-uses-font-glyphs = "yes";
              initial-window-mode = "maximized";
              bold-text-in-bright = "yes";
              
            };
          scrollback = {
              lines = 100000;
            };
        };

    };

}
