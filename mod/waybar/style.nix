{
        programs.waybar.style = ''
                /* catppuccin macchiato */
                @define-color rosewater #f4dbd6;
                @define-color flamingo #f0c6c6;
                @define-color pink #f5bde6;
                @define-color mauve #c6a0f6;
                @define-color red #ed8796;
                @define-color maroon #ee99a0;
                @define-color peach #f5a97f;
                @define-color yellow #eed49f;
                @define-color green #a6da95;
                @define-color teal #8bd5ca;
                @define-color sky #91d7e3;
                @define-color sapphire #7dc4e4;
                @define-color blue #8aadf4;
                @define-color lavender #b7bdf8;
                @define-color text #cad3f5;
                @define-color subtext1 #b8c0e0;
                @define-color subtext0 #a5adcb;
                @define-color overlay2 #939ab7;
                @define-color overlay1 #8087a2;
                @define-color overlay0 #6e738d;
                @define-color surface2 #5b6078;
                @define-color surface1 #494d64;
                @define-color surface0 #363a4f;
                @define-color base #1e1e2e;
                @define-color mantle #1e2030;
                @define-color crust #181926;

                * {
                        font-family: "JetBrainsMono Nerd Font", Roboto, Helvetica, Arial, sans-serif;
                        font-size: 14px;
                }

                window#waybar {
                        background-color: rgba(0, 0, 0, 0);
                        border-radius: 13px;
                        transition-property: background-color;
                        transition-duration: .5s;
                }

                button {
                        box-shadow: inset 0 -3px transparent;
                        border: none;
                        border-radius: 0;
                }

                button:hover {
                        background: inherit;
                        box-shadow: inset 0 -3px #ffffff;
                }

                #pulseaudio:hover {
                        background-color: @surface2;
                }

                #workspaces button {
                        padding: 0 5px;
                        background-color: transparent;
                        color: #ffffff;
                }

                #mode {
                        background-color: #64727D;
                        box-shadow: inset 0 -3px #ffffff;
                }

                #custom-vpn {
                        padding: 0 8px;
                }

                #custom-vpn.connected {
                        color: @green;
                }

                #custom-vpn.disconnected {
                        color: @yellow;
                }

                #tray {
                        padding: 0px 10px;
                }

                #clock,
                #battery,
                #cpu,
                #memory,
                #temperature,
                #network,
                #pulseaudio {
                        padding: 0 10px;
                }

                #pulseaudio {
                        color: @maroon;
                }

                #network {
                        color: @yellow;
                }

                #temperature {
                        color: @sky;
                }

                #battery {
                        color: @green;
                }

                #clock {
                        color: @flamingo;
                }

                #window {
                        color: @rosewater;
                }

                .modules-right,
                .modules-left,
                .modules-center {
                        background-color: @base;
                        border-radius: 15px;
                }

                .modules-right {
                        padding: 0 10px;
                }

                .modules-left {
                        padding: 0 20px;
                }

                .modules-center {
                        padding: 0 10px;
                }

                #battery.charging,
                #battery.plugged {
                        color: @sapphire;
                }

                @keyframes blink {
                        to {
                                color: #000000;
                        }
                }

                #battery.critical:not(.charging) {
                        background-color: #f53c3c;
                        color: #ffffff;
                        animation-name: blink;
                        animation-duration: 0.5s;
                        animation-timing-function: steps(12);
                        animation-iteration-count: infinite;
                        animation-direction: alternate;
                }

                label:focus {
                        background-color: #000000;
                }

                #pulseaudio.muted {
                        color: @text;
                }
        '';
}
