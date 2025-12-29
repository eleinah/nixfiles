{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xwayland-satellite
    udiskie
  ];
}
