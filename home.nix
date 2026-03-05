{ config, pkgs, ... }:

{
        imports = [
                ./mod/hyprland
        ];

        home.username = "ryusuke";
        home.homeDirectory = "/home/ryusuke";
	programs.bash = {
		enable = true;
                enableCompletion = true;
		shellAliases = {
			ls ="eza --icons";
			cat = "bat --theme 'Catppuccin Mocha'";
			vim = "lvim";
			wl-copy = "copy";
			info = "info --vi-keys";
			ikhal = "LC_ALL=en_US.UTF-8 ikhal";
		};
                bashrcExtra = ''
                eval "$(oh-my-posh init bash --config ~/.config/posh/catppuccin_mocha.omp.json)"
                eval "$(fzf --bash)"
                FZF_CTRL_R_COMMAND= FZF_ALT_C_COMMAND= eval "$(fzf --bash)"
                eval "$(zoxide init --cmd cd bash)"
                '';
	};	

        home.stateVersion = "25.11";

        home.packages = with pkgs; [
                bat
                python313Packages.aria2p
                aerc
                localsend
                gearlever
                hyprpaper 
                senpai
                swayimg
                (pkgs.rofi.override {
                         plugins = [ pkgs.rofi-emoji ];
                })
                osu-lazer-bin
                profanity
        ];
        
        home.file = {};
        home.sessionVariables = {
                LC_ALL="ja_JP.UTF-8";
                EDITOR = "vim";
                XMODIFIERS="@im=fcitx";
                GTK_IM_MODULE="fcitx";
                GLFW_IM_MODULE="fcitx";
                QT_IM_MODULES="wayland;fcitx";
                QT_QPA_PLATFORMTHEME="qt6ct";
                MANPAGER="bat -l man --color always --style grid";
                BUN_INSTALL="$HOME/.bun";
                DOTNET_ROOT="$HOME/.local/bin";
                SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh";
                
        };
	home.sessionPath = [
                "$HOME/.local/bin"
		"$HOME/.cargo/bin"
                "$HOME/rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"
                "$HOME/go/bin"
		"$HOME/$DOTNET_ROOT/tools"
                "$HOME/.bun/bin"
	];

        programs.home-manager.enable = true;
        nixpkgs.config.allowUnfree = true;
}
