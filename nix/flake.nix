{
  description = "My nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    chezmoiUrl = "https://github.com/peterfication/config-moi.git";
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        chezmoi
        rclone
        sshs
        vim
      ];

      environment.shellAliases = {
        # Run darwin-rebuild from the nix config directory
        nix-rebuild = "(cd ~/config/nix && just darwin-rebuild)";
        # Open vim with the chezmoi config
        conf = " cd $(chezmoi source-path) && vim";
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Enable touch ID authentication for sudo.
      security.pam.services.sudo_local.touchIdAuth = true;

      system.activationScripts = {
        # See https://github.com/nix-darwin/nix-darwin/blob/master/modules/system/activation-scripts.nix#L154
        # for available activation scripts.
        postActivation = {
          text = ''
            echo ""
            echo "Running chezmoi init ..."
            sudo -u "$(logname)" env HOME="/Users/$(logname)"  ${pkgs.chezmoi}/bin/chezmoi init --apply "${chezmoiUrl}"
            echo "Running chezmoi init done"
            echo ""
          '';
        };
      };
    };
  in
  {
    # First time run:
    # sudo nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- --flake ~/config/nix#simple switch

    # Following darwin builds:
    # sudo darwin-rebuild switch --flake ~/config/nix#simple
    darwinConfigurations."simple" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
