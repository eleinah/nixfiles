{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.dankMaterialShell = {
    enable = true;

    default.settings.theme = "dark";

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
  };
}
