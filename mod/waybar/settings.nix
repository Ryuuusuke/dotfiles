{ pkgs, ... }:

let
        vpn-check = pkgs.writeShellScript "vpn-check.sh" ''
                ping -q -w 1 -c 1 10.11.11.2 >/dev/null \
                && echo '{"text":"Connected", "alt": "connected", "class":"connected", "tooltip":"Connected to WireGuard"}' \
                || echo '{"text":"Disconnected", "alt": "disconnected", "class":"disconnected", "tooltip":"Not Connected to WireGuard"}'
        '';
in
{
        programs.waybar.settings = [
        {
                margin-top = 5;
                margin-left = 10;
                margin-right = 10;
                height = 30;
                modules-left = [
                        "hyprland/window"
                ];
                modules-center = [
                        "clock"
                        "mpd"
                ];
                mpd = {
                        server = "localhost";
                        port = "6600";
                        format-stopped = "";
                        dynamic-order = [
                                "title"
                                "artist"
                        ];
                        format = "{stateIcon} {artist} - {title} ";
                        on-click = "mpc toggle";
                        dynamic-len = 50;
                        state-icons = {
                                playing = " ";
                                paused = "󰏤";
                        };
                };
                clock = {
                        locale = "ja_JP.UTF-8";
                        tooltip-format = "<big>{:%Y %B}</big><tt><big>{calendar}</big></tt>";
                        format-alt = "{:%Y-%m-%d}";
                        calendar = {
                                mode-mon-col = 3;
                                on-scroll = 1;
                                format = {
                                        months = "<span color='#ffead3'><b>{}</b></span>";
                                        days = "<span color='#ecc6d9'><b>{}</b></span>";
                                        weeks = "<span color='#99ffdd'><b>W{:%V}</b></span>";
                                        weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                                        today = "<span color='#ff6699'><b><u>{}</u></b></span>";
                                };
                        };
                };
                modules-right = [
                        "custom/vpn"
                        "tray"
                        "pulseaudio"
                        "temperature"
                        "battery"
                ];
                tray = {
                        icon-size = 17;
                        spacing = 18;
                };
                "hyprland/window" = {
                        format = "{}";
                        max-length = 35;
                        rewrite."" = "Harsh";
                        separate-outputs = true;
                };
                "hyprland/workspaces" = {
                        format = "{icon}";
                        on-click = "activate";
                        format-icons.active = " ";
                        sort-by-number = true;
                        persistent-workspaces = {
                                "*" = 4;
                                HDMI-A-1 = 3;
                        };
                };
                cpu = {
                        format = "  {usage}%";
                        tooltip = false;
                };
                memory.format = "{}%  ";
                temperature = {
                        critical-threshold = 80;
                        format = "{icon} {temperatureC}°C";
                        format-icons = [
                                ""
                                ""
                                ""
                                ""
                        ];
                };
                battery = {
                        states = {
                                warning = 30;
                                critical = 15;
                        };
                        format = "{icon}  {capacity}%";
                        format-icons = [
                                ""
                                ""
                                ""
                                ""
                                ""
                        ];
                };
                pulseaudio = {
                        format = "{icon}  {volume}%";
                        format-bluetooth = "{volume}% {icon} {format_source}";
                        format-bluetooth-muted = " {icon} {format_source}";
                        format-muted = "";
                        format-icons = {
                                headphone = "";
                                hands-free = "";
                                headset = "";
                                phone = "";
                                portable = "";
                                car = "";
                                default = [
                                        ""
                                        ""
                                        ""
                                ];
                        };
                        on-click = "pavucontrol";
                };
                "custom/vpn" = {
                        format = "{icon}";
                        exec = "${vpn-check}";
                        return-type = "json";
                        interval = 5;
                        format-icons = {
                                connected = "";
                                disconnected = "";
                        };
                };
        }
        ];
}
