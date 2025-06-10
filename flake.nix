{
  description = "My nix flake :D";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-25.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      username = "hesham";
    in
      {
        nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
          modules = [ ./home.nix ];
        };
	homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          # username = "your-username";
          # homeDirectory = "/home/your-username";
	  modules = [ ./home.nix ];
	  extraSpecialArgs = { inherit inputs; };
	};
        defaultPackage.x86_64-linux = self.homeConfigurations.${username}.activationPackage;
      };
}
