{ pkgs, ... }:

{
        programs.waybar.enable = true;

        home.packages = with pkgs; [
                bat
                bun
                python313Packages.aria2p
                aerc
                localsend
                gearlever
                hyprpaper 
                senpai
                swayimg
                profanity
                newest.tetrio-desktop
                newest.osu-lazer-bin
        ];
}
