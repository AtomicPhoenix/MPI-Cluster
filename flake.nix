{
  description = "A flake to setup an OpenMPI cluster of CUDA-capable machines";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Neovim configuration system for Nix
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home-Manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # Inherits `inputs.nixpkgs` of current flake
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nvf,
    home-manager,
    ...
  } @ inputs: let
    mkNixOsConfiguration = hostname:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;}; # Let submodules access inputs
        system = "x86_64-linux";
        modules = [
          # Device configuration file
          ./hosts/${hostname}

          # NixOS Modules
          nvf.nixosModules.default

          # NIXOS Modules Configuration
          ./modules/nixos

          # Home-Manager Module
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true; # Use nixos's pkgs value
              extraSpecialArgs = inputs; # Pass arguments to home modules
              users.gpgup.imports = [./modules/home/${hostname}.nix];
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      worker1 = mkNixOsConfiguration "worker1";
      worker2 = mkNixOsConfiguration "worker2";
    };
  };
}
