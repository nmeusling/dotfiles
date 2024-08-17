{
  description = "My Dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShell."${system}" = pkgs.mkShell {
        # inherit (self.checks.pre-commit-check) shellHook;
        # buildInputs = self.checks.pre-commit-check.enabledPackages;

        packages = with pkgs; [
          # tools
          pre-commit
          nixpkgs-fmt
          # language server
          yaml-language-server
          nil
        ];
      };

      nixosConfigurations = {
        cthylla = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/cthylla/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };
      };

      homeConfigurations = {
        nmeusling = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager
          ];
        };
      };

    };
}
