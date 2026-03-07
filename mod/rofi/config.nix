{ pkgs, ... }:
{
        programs.rofi = {
                enable = true;
                plugins = [ pkgs.rofi-emoji ];

                extraConfig = {
                        fixed-num-lines = true;
                        show-icons = true;
                        terminal = "${pkgs.foot}/bin/foot";
                        icon-theme = "Papirus";
                        eh = 1;
                        opacity = "0.9";
                        display-drun = "Apps";

                        "timeout-action" = "kb-cancel";
                        "timeout-delay" = 0;

                        "filebrowser-directories-first" = true;
                        "filebrowser-sorting-method" = "name";
                };
        };
}
