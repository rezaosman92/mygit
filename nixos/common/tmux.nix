{config, ...}:

{

programs.tmux = {
        enable = true;
        historyLimit = 10000;
        clock24 = true;
        terminal = "foot";
        newSession = true;
    };

}
