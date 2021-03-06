with import <nixpkgs> {};

mkShell {
  buildInputs = [
    gnumake
    gcc
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    freetype
    pkgconfig
    ncurses
    fontconfig
  ];
}
