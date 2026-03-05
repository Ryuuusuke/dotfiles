{ config, pkgs, ... }:

{
        # Home Manager needs a bit of information about you and the paths it should
        # manage.
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

        # This value determines the Home Manager release that your configuration is
        # compatible with. This helps avoid breakage when a new Home Manager release
        # introduces backwards incompatible changes.
        #
        # You should not change this value, even if you update Home Manager. If you do
        # want to update the value, then make sure to first check the Home Manager
        # release notes.
        home.stateVersion = "25.11"; # Please read the comment before changing.

        # The home.packages option allows you to install Nix packages into your
        # environment.
        home.packages = with pkgs; [
        # # Adds the 'hello' command to your environment. It prints a friendly
        # # "Hello, world!" when run.
        bat
        hello
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
        
        # # It is sometimes useful to fine-tune packages, for example, by applying
        # # overrides. You can do that directly here, just don't forget the
        # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
        # # fonts?
        # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
        
        # # You can also create simple shell scripts directly inside your
        # # configuration. For example, this adds a command 'my-hello' to your
        # # environment:
        # (pkgs.writeShellScriptBin "my-hello" ''
        #   echo "Hello, ${config.home.username}!"
        # '')
                        ];
        
        # Home Manager is pretty good at managing dotfiles. The primary way to manage
        # plain files is through 'home.file'.
        home.file = {
        # # Building this configuration will create a copy of 'dotfiles/screenrc' in
        # # the Nix store. Activating the configuration will then make '~/.screenrc' a
        # # symlink to the Nix store copy.
        # ".screenrc".source = dotfiles/screenrc;
        
        # # You can also set the file content immediately.
        # ".gradle/gradle.properties".text = ''
        #   org.gradle.console=verbose
        #   org.gradle.daemon.idletimeout=3600000
        # '';
                };
        
        # Home Manager can also manage your environment variables through
        # 'home.sessionVariables'. These will be explicitly sourced when using a
        # shell provided by Home Manager. If you don't want to manage your shell
        # through Home Manager then you have to manually source 'hm-session-vars.sh'
        # located at either
        #
        #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
        #
        # or
        #
        #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
        #
        # or
        #
        #  /etc/profiles/per-user/ryusuke/etc/profile.d/hm-session-vars.sh
        #
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

        # Let Home Manager install and manage itself.
        programs.home-manager.enable = true;
        nixpkgs.config.allowUnfree = true;
}
