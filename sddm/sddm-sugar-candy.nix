{ pkgs }: pkgs.stdenv.mkDerivation {
  name = "sugar light";
  src = pkgs.fetchFromGitHub {
    owner = "Kangie";
    repo = "sddm-sugar-candy";
    rev = "master";
    sha256 = "p2d7I0UBP63baW/q9MexYJQcqSmZ0L5rkwK3n66gmqM=";
  };

  installPhase = ''
    mkdir -p $out 
    cp -R ./* $out/
  '';
}

