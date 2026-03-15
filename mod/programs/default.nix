{ pkgs, ... }:

{
        programs.waybar.enable = true;

        home.packages = with pkgs; [
                aerc
                anki
                bat
                bun
                cava
                python313Packages.aria2p
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
