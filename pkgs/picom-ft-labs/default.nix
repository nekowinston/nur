{
  picom,
  pcre2,
  fetchFromGitHub,
}:
picom.overrideAttrs (oldAttrs: {
  pname = "picom-ft-labs";
  version = "unstable-2022-02-06";

  buildInputs = [pcre2] ++ oldAttrs.buildInputs;

  src = fetchFromGitHub {
    owner = "FT-Labs";
    repo = "picom";
    sha256 = "sha256-hDuL5g5+l0IUqq6jYdVXDtaTbheuLPzo/SaUY+WtoH8=";
    rev = "dc9d1fe2481e7de1a52b0ff98b4253a4f5da0493";
  };
})
