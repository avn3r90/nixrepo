{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.toster = nixpkgs.lib.nixosSystem {
      # Przekazanie dodatkowych argumentów do modułów
      specialArgs = { inherit inputs; pkgs = import nixpkgs { system = "x86_64-linux"; }; };
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        ./modules/firefox.nix
        # Osobny moduł dla activationScripts
        ({ config, pkgs, lib, ... }: {
          system.activationScripts.report-changes = ''
            PATH=$PATH:${lib.makeBinPath [ pkgs.nix ]}
            echo "+++++ CHANGES +++++"
            nix store diff-closures $(ls -dv /nix/var/nix/profiles/system-*-link/ | tail -2)
          '';
        })
      ];
    };
  };
}
