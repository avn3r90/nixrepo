{ config, pkgs, ... }:

{
  home.username = "fi9o";
  home.homeDirectory = "/home/fi9o";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # konsola
    pkgs.bat
    pkgs.eza
    pkgs.fzf
    pkgs.btop
    pkgs.micro
    pkgs.yazi
    pkgs.git
    pkgs.fastfetch
    pkgs.grim
    #pkgs.patool
    pkgs.ncdu
    pkgs.nix-search
    pkgs.nvd
    pkgs.nix-tree
    pkgs.tldr
    pkgs.yadm

    # xfce
    pkgs.xfce.xfce4-whiskermenu-plugin
    pkgs.qogir-icon-theme
    pkgs.qogir-theme
    
    # inne
    pkgs.blueman
    pkgs.signal-desktop
    pkgs.thunderbird
    #pkgs.qbittorrent
    pkgs.stremio
    #pkgs.vlc
  ];

  imports = [
  	./modules/git.nix
  	./modules/bash.nix
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
  #  /etc/profiles/per-user/fi9o/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "micro";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
