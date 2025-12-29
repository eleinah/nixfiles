{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./gpg-agent.nix
  ];
}
