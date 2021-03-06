self: super:

{
  st = super.stdenv.mkDerivation rec {
    name = "st";
    buildInputs = [
      super.xorg.libX11
      super.xorg.libXft
      super.xorg.libXinerama
      super.freetype
      super.pkgconfig
      super.ncurses
      super.fontconfig
    ];
    configFile = ~/suckless/st/config.h;
    src = ~/suckless/st/src;
    patches = [
      ~/suckless/st/st-alpha-0.8.2.diff
      ~/suckless/st/st-scrollback-20200419-72e3f6c.diff
      ~/suckless/st/st-externalpipe-0.8.4.diff
    ];

    postPatch = ''
      cp -f ${configFile} config.h
    '';
    installPhase = ''
      TERMINFO=$out/share/terminfo make install PREFIX=$out
    '';
  };
}
