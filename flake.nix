{
  description = "My nix flake :D";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # QuickShell
    quickshell = {
      # remove ?ref=v0.1.0 to track the master branch
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "hesham";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      {
        defaultPackage.x86_64-linux = self.homeConfigurations.${username}.activationPackage;
        nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
          pkgs = import nixpkgs {
            system = system;
          };
        };
        homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [
            stylix.homeModules.stylix
            ./home/home.nix
          ];
        };
      };
}
