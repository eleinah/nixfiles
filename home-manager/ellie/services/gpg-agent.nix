{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.gpg-agent = {
    enable = true;
    enableScDaemon = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    enableZshIntegration = true;
    pinentry.package = pkgs.pinentry-qt;
    extraConfig = ''
      allow-emacs-pinentry
      allow-loopback-pinentry
    '';
  };
}
