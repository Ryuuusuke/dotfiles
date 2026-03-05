{
        exec-once = [
                "pipewire &"
                "pipewire-pulse &"
                "wireplumber &"
                "eww open activate-linux"
        ];

        env = [
                "QT_QPA_PLATFORMTHEME, qt6ct"
                "HYPRCURSOR_THEME, rose-pine-hyprcursor"
                "HYPRCURSOR_SIZE, 34"
        ];

}
