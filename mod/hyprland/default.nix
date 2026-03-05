{ ... }:
{
        imports = [
                ./wm/autostart.nix
                ./wm/keybind.nix
                ./wm/lookandfeel.nix
                ./wm/rules.nix
                ./wm/system.nix
                ./ecosystem/hypridle.nix
                ./ecosystem/hyprpaper.nix
        ];

        wayland.windowManager.hyprland = {
                enable = true;
        };
}
