{
  lib,
  rustPlatform,
  fetchFromGitLab,
}:
rustPlatform.buildRustPackage rec {
  pname = "hourglass";
  version = "main";
  src = fetchFromGitLab {
    owner = "alxhr0";
    repo = "hourglass";
    rev = version;
    hash = "sha256-PZDqjVOGtgj5sqTLbNOaVZ7fFKPAl2uwTMD2Nnr3ECs=";
  };
  cargoHash = "sha256-7vlMvJV1QS0tWlM06dm80mTeKeSc9unZRMzxO6r/bh8=";
  meta = {
    description = "";
    homepage = "https://gitlab.com/alxhr0/hourglass";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [];
    mainProgram = "hourglass";
  };
}
