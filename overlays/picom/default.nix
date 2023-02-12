self: super: {
  picom = super.picom.overrideAttrs (old: {
    version = "unstable-2022-02-06";
    src = super.fetchFromGitHub {
      owner = "FT-Labs";
      repo = "picom";
      sha256 = "sha256-uH0OuM36xnvGC6TMJ7r7nlx8ZUGgL8N6ia/6KzFksVY=";
      rev = "bb2b4801f7aef81f0739a50bf272431f7d7d9549";
    };
    nativeBuildInputs = old.nativeBuildInputs ++ [super.pcre2];
  });
}
