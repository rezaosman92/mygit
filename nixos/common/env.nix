{ config, pkgs, ... }:

{

  environment = {
    shellAliases = {
      # "ec" = "emacsclient -t";
      "most" = "most -w";
    };

    variables = {
      PAGER = "moor";

    };

  };

}
