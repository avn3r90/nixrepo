{ config, pkgs, ... }:

{
  home.username = "fi9o";
  home.homeDirectory = "/home/fi9o";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
    # konsola
    pkgs.asciinema
    pkgs.bat
    pkgs.eza
    pkgs.fzf
    pkgs.grc
    pkgs.btop
    pkgs.micro
    pkgs.yazi
    pkgs.gh
    pkgs.git
    pkgs.fastfetch
    #pkgs.grim
    #pkgs.patool
    pkgs.ncdu
    pkgs.nh
    #pkgs.nix-search
    pkgs.nvd
    pkgs.nix-tree
    #pkgs.thefuck -> w modules/thefuck.nix
    pkgs.tldr
    pkgs.yadm
    pkgs.wget

    # xfce
    pkgs.xfce.xfce4-battery-plugin
    pkgs.xfce.xfce4-whiskermenu-plugin
    pkgs.qogir-icon-theme
    pkgs.qogir-theme

    # inne z gui
    #pkgs.ghostty 
    pkgs.kitty
    pkgs.blueman
    pkgs.signal-desktop
    pkgs.thunderbird
    pkgs.kodi
    pkgs.qbittorrent
    #pkgs.stremio
    #pkgs.vlc
  ];

  imports = [
  #	./modules/zsh.nix
    ./modules/fish.nix
    ./modules/ohmyposh.nix
    ./modules/thefuck.nix
  	./modules/firefox.nix
  #	./modules/starship.nix
  ];



  programs.git = {
    enable = true;
    userName = "avn3r90";
    userEmail = "fi9o@outlook.com";  
  };
  
  home.shellAliases = {
  l = "eza -l --icons";
 	lss = "eza --icons";
 	ll = "eza -la --icons";
 	ld = "eza -lD --icons";
 	cp = "cp -i";
 	mv = "mv -i";
 	mkdir = "mkdir -p";
 	catt = "bat";
  grep = "grep --color=always";
  df = "df -h";

  #yadm
  ya = "yadm add";
  yc = "yadm commit; yadm push";
  ys = "yadm status";

  # restarty i wylaczanie
 	rebootsafe = "sudo shutdown -r now";
 	rebootforce = "sudo shutdown -r -n now";
 	shutdown = "sudo shutdown";
 	

 	home = "cd ~";

  sduo = "sudo";
  suod = "sudo";

  # inne
  fastfetchplus = "fastfetch --config examples/2.jsonc";
  wget = "wget --progress=dot:mega";
  
  # nixowe
  cleanup = "sudo nix-collect-garbage; sudo nix-collect-garbage -d; sudo nixos-rebuild switch --flake ~/nix/#toster";
  rebuildnix = "sudo nixos-rebuild switch --flake ~/nix/#toster";
  };

  #programs.starship = {
  #  enable = true;
  #  settings = {
  #    # sprawdz ustawienia starship
  #  };
  #};
  
  home.file = {
  };

  #xdg.userDirs = {
 # 	enable = true;
 # 	createDirectories = true;
 # };

  home.sessionVariables = {
    EDITOR = "micro";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
