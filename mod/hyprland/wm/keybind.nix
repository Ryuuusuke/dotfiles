{ config, ... }:
let
        homeDir = config.home.homeDirectory;
        terminal = "footclient";
        menu = "rofi -show drun";
        emoji = "rofi -modi emoji -show emoji";
        mainMod = "SUPER";
        toggleBar = "pkill -SIGUSR1 waybar";
        scripts = "${homeDir}/.config/scripts";
        screenshots = builtins.concatStringsSep " " [
                "${scripts}/grimblast --notify --freeze"
                "copysave area"
                "${homeDir}/Pictures/ss/shot_$(date +'%H:%M_%d-%m-%Y').png"
        ];
        centermode = builtins.concatStringsSep " " [
                "hyprctl --batch" 
                "'dispatch togglefloating;"
                "resizeactive exact 830 970;" 
                "dispatch centerwindow'"
        ];
        record = "${scripts}/record.sh";
        incgamma = "${scripts}/gamma.sh -i";
        decgamma = "${scripts}/gamma.sh -d";
in
{
        wayland.windowManager.hyprland.settings = {
                "$mod" = mainMod;

                bind = [
                        # general
                        "$mod, RETURN, exec, ${terminal}"
                        "$mod, D, exec, ${menu}"
                        "$mod SHIFT, q, killactive"
                        "$mod, f, fullscreen"
                        "$mod, M, exit"
                        "$mod, space, togglefloating"
                        "$mod SHIFT, space, exec, ${centermode}"
                        "$mod SHIFT, v, pseudo"
                        "$mod SHIFT, i, togglesplit"
                        "$mod, p, exec, ${screenshots}"

                        "$mod, h, movefocus, l"
                        "$mod, j, movefocus, d"
                        "$mod, k, movefocus, u"
                        "$mod, l, movefocus, r"

                        "$mod SHIFT, h, movewindow, l"
                        "$mod SHIFT, j, movewindow, d"
                        "$mod SHIFT, k, movewindow, u"
                        "$mod SHIFT, l, movewindow, r"

                        "$mod, S, togglespecialworkspace, magic"
                        "$mod SHIFT, S, movetoworkspace, special:magic"

                        "$mod, mouse_up, workspace, e-1"
                        "$mod, mouse_down, workspace, e+1"

                        # extra
                        "$mod, b, exec, ${toggleBar}"
                        "$mod SHIFT, r, exec, ${record}"
                        "$mod ctrl, u, exec, ${incgamma}"
                        "$mod ctrl, d, exec, ${decgamma}"
                        "$mod ctrl, e, exec, ${emoji}"

                        ",XF86KbdBrightnessUp, exec, brightnessctl -d asus::kbd_backlight set 1+"
                        ",XF86KbdBrightnessDown, exec, brightnessctl -d asus::kbd_backlight set 1-"

                ] ++ (
                        builtins.concatLists (builtins.genList (i:
                        let workspace = i + 1;
                                key = if workspace == 10 then "0" else toString workspace;
                        in [
                                "$mod, ${key}, workspace, ${toString workspace}"
                                "$mod SHIFT, ${key}, movetoworkspace, ${toString workspace}"
                        ]
                        ) 10)
                );

                binde = [
                        "$mod CTRL, h, resizeactive, -30 0"
                        "$mod CTRL, j, resizeactive, 0 30"
                        "$mod CTRL, k, resizeactive, 0 -30"
                        "$mod CTRL, l, resizeactive, 30 0"
                ];

                bindm = [
                        "$mod, mouse:272, movewindow"
                        "$mod, mouse:273, resizewindow"
                ];

                bindel = [
                        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-"
                        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                        ",XF86MonBrightnessUp, exec, brightnessctl set 3%+"
                        ",XF86MonBrightnessDown, exec, brightnessctl set 3%-"
                ];
        };
}
