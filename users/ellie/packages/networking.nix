{ config, pkgs, ... }:

{
  packages = with pkgs; [
    mtr
    dnsutils
    aria2
    nmap
    ipcalc
    tcpdump
  ];
}
