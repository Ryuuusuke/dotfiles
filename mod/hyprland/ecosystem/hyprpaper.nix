{ config, ... }:
let
        homeDir = config.home.homeDirectory;
in
{
        services.hyprpaper = {
                enable = true;
                settings = {
                        preload = "${homeDir}/Pictures/Wallpaper/smoky.jpg";
                        wallpaper = "eDP-1, ${homeDir}/Pictures/Wallpaper/smoky.jpg";
                        splash = false;
                };
        };
}
