{ ... }:
{
        imports = [
                ./autostart.nix
                ./keybind.nix
                ./lookandfeel.nix
                ./rules.hl
                ./system.hl
        ];

        wayland.windowManager.hyprland = {
                enable = true;
        };
}
