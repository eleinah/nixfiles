{
  config,
  lib,
  pkgs,
  ...
}:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "helium-browser.desktop" ];
      "x-scheme-handler/http" = [ "helium-browser.desktop" ];
      "x-scheme-handler/https" = [ "helium-browser.desktop" ];
      "x-scheme-handler/about" = [ "helium-browser.desktop" ];
      "x-scheme-handler/discord" = [ "vesktop.desktop" ];
      "x-scheme-handler/chrome" = [ "helium-browser.desktop" ];
      "application/x-extension-htm" = [ "helium-browser.desktop" ];
      "application/x-extension-html" = [ "helium-browser.desktop" ];
      "application/x-extension-shtml" = [ "helium-browser.desktop" ];
      "application/xhtml+xml" = [ "helium-browser.desktop" ];
      "application/x-extension-xhtml" = [ "helium-browser.desktop" ];
      "application/x-extension-xht" = [ "helium-browser.desktop" ];
    };
  };
}
