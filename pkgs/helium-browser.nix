{ pkgs }:

pkgs.appimageTools.wrapType2 rec {
  pname = "helium-browser";
  version = "0.7.10.1";

  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/0.7.10.1/helium-0.7.10.1-x86_64.AppImage";
    sha256 = "sha256-11xSlHIqmyyVwjjwt5FmLhp72P3m07PppOo7a9DbTcE=";
  };

  meta = with pkgs.lib; {
    description = "Helium Browser for Linux - A private, fast, and honest web browser";
    homepage = "https://github.com/imputnet/helium-linux";
    license = [
      licenses.gpl3
      licenses.bsd3
    ];
    platforms = platforms.linux;
  };
}
