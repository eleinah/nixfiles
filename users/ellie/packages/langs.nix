{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    d2
    shellcheck
    shfmt
    rustup
    python
    python-black
    python-pyflakes
    python-isort
    python-pipenv
    python-nosetests
    python-pytest
    nix
    golang
    xmllint
    npm
    cmake
    make
  ];
}
