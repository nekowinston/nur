self: super: {
  picom = super.picom.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "FT-Labs";
      repo = "picom";
      sha256 = "sha256-MRCffxU0X5a368zJGwzcv25P2ZYyAI31EOBhgiyR71A=";
      rev = "c9aee893d2ab0acc4e997dc4186e7b1ef344ac0f";
    };
    nativeBuildInputs = old.nativeBuildInputs ++ [super.pcre2];
  });
}
