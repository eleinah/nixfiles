{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Eleina Mironia";
        email = "eleina@member.fsf.org";
        signingkey = "6339A81D6B416E97";
      };
      init = {
        defaultBranch = "main";
      };
      commit = {
        gpgsign = true;
      };
    };
  };
}
