{config, ...}:

{
programs.foot = {
    enable = true;
    theme = "modus-operandi";

    
    settings = 
        {
          main = {
              font = "AdwaitaMono:style=Bold:size=12";
              box-drawings-uses-font-glyphs = "yes";
              initial-window-mode = "maximized";
              bold-text-in-bright = "yes";
              
            };

          scrollback = {
              lines = 100000;
            };
        };

    };

}
