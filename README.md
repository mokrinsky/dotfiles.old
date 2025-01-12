# DEPRECATED

This flake is not gonna be updated anymore, I kinda lost interest in refactoring it the way I wanted. Feel free to check [dotfiles](https://github.com/mokrinsky/dotfiles) for the one I use right now.

### my current dotfiles

This is my current system configuration. For now it's only compatible with macOS, but I'm going to port it to NixOS and probably any other linux with Nix Package Manager installed.

For this to work you need to have [nix-darwin](https://github.com/LnL7/nix-darwin) installed.

After that, run

```bash
darwin-rebuild switch --flake .#millia
```

Also this one might work for nixos, but I haven't tried it yet and nixos config are 100% generated default.
```bash
nixos-rebuild switch --flake .#nixos
```
