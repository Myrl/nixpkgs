{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  name = "monoid-v${version}";
  version = "0.61";

  src = fetchurl {
    url = "https://cdn.rawgit.com/larsenwork/monoid/138e2bd5a459265522f0471ec7fa5401525b660b/Monoid-Dollar-l.zip";
    sha256 = "068bgg589q2261qzm4c6w09dd0yrq628jcwcnyfn8jlnccbbs76c";
  };

  nativeBuildInputs = [ unzip ];
  phases = [ "unpackPhase" "installPhase" ];

  unpackPhase =
    ''
      unzip $src
    '';
  installPhase =
    ''
      mkdir -p $out/share/fonts/truetype

      cp *.ttf $out/share/fonts/truetype
    '';

  meta = with stdenv.lib; {
    homepage = http://larsenwork.com/;
    description = "A customizable and optimized font for coding with bitmap-like sharpness";
    maintainers = with stdenv.lib.maintainers; [ myrl ];
    license = licenses.mit;
    platforms = platforms.all;
  };
}
