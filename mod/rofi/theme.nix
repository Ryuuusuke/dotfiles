{ config, ... }:
let
        inherit (config.lib.formats.rasi) mkLiteral;
in
{
        programs.rofi.theme = {
                "*" = {
                        text-color =       mkLiteral  "#f2f2f2";
                        background-color = mkLiteral  "#000000";
                        lightbg =          mkLiteral  "#534c48";
                        red =              mkLiteral  "#f15d22";
                        orange =           mkLiteral  "#faa41a"; 
                        blue =             mkLiteral  "#48b9c7";
                        pywal-color =      mkLiteral  "#ABE9B3";
                        black-foreground = mkLiteral  "#000000";

                        selected-normal-foreground =  mkLiteral "@foreground";
                        normal-foreground =           mkLiteral "@foreground";
                        alternate-normal-background = mkLiteral "@background";
                        selected-urgent-foreground =  mkLiteral "@foreground";
                        urgent-foreground =           mkLiteral "@foreground";
                        alternate-urgent-background = mkLiteral "@background";
                        active-foreground =           mkLiteral "@foreground";
                        selected-active-foreground =  mkLiteral "@foreground";
                        alternate-normal-foreground = mkLiteral "@foreground";
                        alternate-active-background = mkLiteral "@blue";
                        bordercolor =                 mkLiteral "@foreground";
                        normal-background =           mkLiteral "@background";
                        selected-normal-background =  mkLiteral "@blue";
                        separatorcolor =              mkLiteral "@orange";
                        spacing =                     mkLiteral "2";
                        urgent-background =           mkLiteral "@red";
                        alternate-urgent-foreground = mkLiteral "@foreground";
                        selected-urgent-background =  mkLiteral "@red";
                        alternate-active-foreground = mkLiteral "@foreground";
                        selected-active-background =  mkLiteral "@blue";
                        active-background =           mkLiteral "@orange";
                };

                "window" = {
                        width =            mkLiteral "27%";
                        border =              1;
                        border-color =     mkLiteral "@pywal-color";
                        border-radius =    mkLiteral "0px";
                        padding =             5;
                        text-color =       mkLiteral "@orange";
                        background-color = mkLiteral "@background";
                        transparency =     "real";
                };

                "mainbox" = {
                        border = 0;
                        backgorund-color = mkLiteral "#00000000";
                        border-radius =    mkLiteral "0% 0% 0% 0%";
                        children =     map mkLiteral [ "inputbar" "listview" ];
                        spacing =          mkLiteral "1%";
                        padding =          mkLiteral "1% 1% 1% 1%";
                 };

                "message" = {
                        border =     mkLiteral "1px dash 0px 0px";
                        text-color = mkLiteral "@orange";
                        padding =    mkLiteral "2px 0px 0px";
                };

                "textbox".text-color = mkLiteral "@color";

                "prompt" = {
                        enabled = true;
                        background-color = mkLiteral "@pywal-color";
                        text-color =       mkLiteral "@black-foreground";
                        padding = 	   mkLiteral "0.25% 0.75% 0.25% 0.75%";
                        border-radius =    mkLiteral "5%";
                };

                "inputbar".children = map mkLiteral [
                        "prompt"
                        "textbox-prompt-colon"
                        "entry"
                        "case-indicator"
                ];

                "entry, case-indicator" = {
                        background-color = mkLiteral "#00000000";
                };

                "textbox-prompt-colon" = {
                        background-color = mkLiteral "#00000000";
                        expand =           false;
                        str =              " ::";
                        margin =           mkLiteral "0px 0.3em 0em 0em";
                        text-color =       mkLiteral "@normal-foreground";
                };

                "listview" = {
                        fixed-height = 0;
                        border =           mkLiteral "2px 0px 0px";
                        padding =          mkLiteral "0px 0px 0px";
                        background-color = mkLiteral "#00000000";
                        columns  = 1;
                        lines =  5;
                        spacing =          mkLiteral "1%";
                };

                "element" = {
                        border = 0;
                        text-color =       mkLiteral "#ffffffff";
                        background-color = mkLiteral "#00000000";
                };

                "element-icon" = {
                        size =       mkLiteral "32px";
                        text-color = mkLiteral "inherit";
                };

                "element-text" = {
                        background-color = mkLiteral "#00000000";
                        text-color =       mkLiteral "inherit";
                };

                "element selected" = {
                        background-color = mkLiteral "#00000000";
                        text-color =       mkLiteral "@pywal-color";
                        border =	   mkLiteral "0% 0% 0% 0%";
                        border-radius =    mkLiteral "4px";
                };

                "inputbar" = {
                        spacing = 0;
                        background-color = mkLiteral "#00000000";
                        border =           mkLiteral "0px";
                        text-color =       mkLiteral "@orange";
                };

                "button normal".text-color = mkLiteral "@orange";
        };
}
