{ pkgs, ... }:
{
        imports = [ 
                ./config.nix
                ./theme.nix
        ];
        programs.rofi = {
                enable = true;
                font = "JetBrains Mono Regular 14";
                modes = [ "drun" "emoji" "window" ];
                plugins = [
                        pkgs.rofi-emoji
                ];
        };
}
