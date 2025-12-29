{
  config,
  lib,
  pkgs,
  ...
}:

let
  scriptNames = lib.attrNames (builtins.readDir ./scripts);
  scripts = builtins.map (
    name: pkgs.writeShellScriptBin name (builtins.readFile (./scripts + "/${name}"))
  ) scriptNames;
in
{
  home.packages = scripts;
}
