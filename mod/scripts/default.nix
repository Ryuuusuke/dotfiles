{ pkgs, ...}:

{
        home.packages = [
                (import ./rofi-askpass.nix { inherit pkgs; })
        ];

        home.sessionVariables = {
                SSH_ASKPASS = "rofi-askpass";
        };
}
