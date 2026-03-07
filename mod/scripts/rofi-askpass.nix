{ pkgs }:

pkgs.writeShellScriptBin "rofi-askpass" ''
        PROMPT="$1"
        ROFI="${pkgs.rofi}/bin/rofi"

        if [[ "$PROMPT" == *[Pp]assword* ]] || [[ "$PROMPT" == *passphrase* ]]; then
                $ROFI -dmenu -p "$PROMPT" -password -lines 0 -theme-str 'window {height: 71px;}'
        else
                $ROFI -dmenu -p "$PROMPT" -lines 0 -theme-str 'window {height: 71px;}'
        fi
''
