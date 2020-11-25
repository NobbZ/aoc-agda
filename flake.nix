{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            (agda.withPackages (p: [
              p.standard-library
              (p.agda-prelude.overrideAttrs (oa: {
                version = "074ae26cefd162187a8b8395184dcada32515951";
                src = fetchFromGitHub {
                  owner = "UlfNorell";
                  repo = "agda-prelude";
                  rev = "074ae26cefd162187a8b8395184dcada32515951";
                  sha256 = "sha256-VAfUze2deTMEksnOm/Tm/6MCI4kWPz6wFZhiMRpcGYk=";
                };
              }))
            ]))
          ];

          shellHook = ''
            export EMACSLOADPATH="$(dirname $(agda-mode locate))":
          '';
        };
      }
    );

}
