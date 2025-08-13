# Nix on macOS

See [Nixcademy: Setting up Nix on macOS](https://nixcademy.com/posts/nix-on-macos/) and [DeterminateSystems/nix-installer](https://github.com/DeterminateSystems/nix-installer).

> NOTE: The Determinate shell installer has to be used with the normal Nix install. (no `--determinate` flag and answering no)

See [Justfile](Justfile) for useful commands.

## Getting started

```bash
# Install nix with determinate installer but with nix upstream
curl -fsSL https://install.determinate.systems/nix | sh -s -- install

# Clone and link the nix folder (amongst others) with a temporary chezmoi bin
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply https://github.com/peterfication/config-moi
rm ~/.local/bin/chezmoi

# Run the initial nix-darwin command
sudo nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- --flake ~/.config/nix#simple switch

# Run the nix-rebuild alias in a new shell
nix-rebuild
```
