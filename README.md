# Ellie's Nixfiles ❄

Hi there, I'm starting to really enjoy Nix and NixOS so far.

I've been slowly moving my hosts to NixOS:
- mainstation -- main gaming and development rig
- travelstation -- my beloved laptop

and a few servers:
- boxoffice -- my media server stack w/ qBittorrent, Jellyfin, Jellyseerr, Prowlarr, Radarr, and Sonarr
- choral -- a music server stack (this is planned)

## Packages & Modules

You can find some of my custom made packages and modules under the `pkgs` and `modules` directories.

### pkgs/

- `librepods.nix` - version 0.1.0 of LibrePods for Linux
- `helium-browser.nix` - version 0.7.10.1 of Helium Browser for Linux

### modules/

Everything from `pkgs/` must be [overlayed in nixpkgs](./overlays/default.nix) (at least with how I'm doing things) before importing the module into your Home Manager configuration.

#### nixos

Empty at the moment.

#### home-manager

- `librepods.nix` - defines `programs.librepods` for Home Manager use. 
- `helium-browser.nix` - defines `programs.helium-browser` for Home Manager use. 
