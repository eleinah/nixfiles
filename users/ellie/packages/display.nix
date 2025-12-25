{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
    mako
    waybar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    swaybg
    swayidle
    swaylock
    xwayland-satellite
    udiskie
    rofi
  ];
}
