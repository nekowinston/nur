{
  buildNpmPackage,
  lib,
  pkgs,
  ...
}:
buildNpmPackage {
  pname = "nodePackages.emmet-ls";
  version = "0.3.1";

  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/emmet-ls/-/emmet-ls-0.3.1.tgz";
    sha512 = "sha512-SbNxxpLHnkaT/lA8CpOnnu1fH+VMzEAniAoyqQV+CGVJ9BYwHbaDlOPRckoJFK/6czWCQqDWax1Gk5Pa+HrNmA==";
  };

  makeCacheWritable = true;
  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  npmDepsHash = "sha256-azK0KGPo1r3jJA87E1QNnj54KMxCmBnh6wcagwSU6Fo=";

  meta = with lib; {
    description = "Emmet language server";
    homepage = "https://github.com/aca/emmet-ls";
    license = licenses.mit;
  };
}
