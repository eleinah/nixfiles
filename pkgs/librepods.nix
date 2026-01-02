{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "librepods";
  version = "linux-v0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "kavishdevar";
    repo = "librepods";
    rev = "${version}";
    hash = "sha256-ZvHbSSW0rfcsNUORZURe0oBHQbnqmS5XT9ffVMwjIMU=";
  };

  nativeBuildInputs = with pkgs; [
    cmake
    ninja
    pkg-config
    qt6.wrapQtAppsHook
  ];

  buildInputs = with pkgs; [
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qttools
    qt6.qtconnectivity
    pulseaudio
    openssl
  ];

  sourceRoot = "${src.name}/linux";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp librepods $out/bin/librepods

    runHook postInstall
  '';

  meta = with pkgs.lib; {
    description = "AirPods liberated from Apple's ecosystem.";
    homepage = "https://github.com/kavishdevar/librepods";
    license = licenses.agpl3Plus;
    platforms = platforms.linux;
  };
}
