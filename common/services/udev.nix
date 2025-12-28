{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.udev = {
    extraRules = ''
      # Allow Keymapp to flash Voyager
      SUBSYSTEMS=="usb", ATTRS{idVendor}="3297", MODE:="0666", SYMLINK+="ignition_dfu"
    '';
  };
}
