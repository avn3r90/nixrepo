{ pkgs, ... }:
{
    shellAliases = {
      ls = "eza --icons";
      cat="bat";
      mv="mv -v";
      cp="rsync -ah --progress";
      #alias poweroff="sudo /sbin/poweroff";
      lu="du -sh * | sort -h"; 
      rm="rm -rf";
      
      update = "sudo nixos-rebuild switch --flake ~/nix/toster";
    };

#    history = {
#      size = 10000;
#      path = "${config.xdg.dataHome}/zsh/history";
#    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git"  ];
      theme = "robbyrussell";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } 
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } 
      ];
    };
}
