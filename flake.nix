{
        description = "Ryusuke's Flake";

        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
                unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";

                home-manager = {
                        url = "github:nix-community/home-manager/release-25.11";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
        };

        outputs = { nixpkgs, unstablepkgs, home-manager, ... }:
        let
                system = "x86_64-linux"; 
                newestpkgs = import unstablepkgs {
                inherit system;
                config.allowUnfree = true;
                };
        in 
        {
                homeConfigurations."ryusuke" = home-manager.lib.homeManagerConfiguration {
                        pkgs = nixpkgs.legacyPackages.${system};
                        extraSpecialArgs = { inherit newestpkgs; };

                        modules = [ ./home.nix ];
                };
        };
}
