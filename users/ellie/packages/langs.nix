{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    d2
    shellcheck
    shfmt
    rustup
    python3
    black
    python313Packages.pyflakes
    isort
    pipenv
    python313Packages.nose2
    python313Packages.pytest
    nixfmt
    go
    gopls
    gomodifytags
    gotests
    gore
    libxml2
    cmake
    gnumake
  ];
}
