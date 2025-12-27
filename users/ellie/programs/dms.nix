{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.dankMaterialShell = {
    enable = true;

    default.settings = {
      theme = "dark";
      dynamicTheming = true;
    };

    niri = {
      enableKeybinds = true;
      enableSpawn = true;
    };

    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
  };
}
