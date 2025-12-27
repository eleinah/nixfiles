{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.dms-shell = {
    enable = true;

    default.settings = {
      theme = "dark";
      dynamicTheming = true;
    };

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
