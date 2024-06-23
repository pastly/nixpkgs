{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools-scm
, pdm-backend
 }:

buildPythonPackage rec {
  pname = "marko";
  version = "2.1.2";
  pyproject = true;

  src = fetchFromGitHub rec {
    inherit version;
    owner = "frostming";
    repo = "marko";
    rev = "v${version}";
    hash = "sha256-KqdBYmlVs00atXy7MSsriRBnL7w13io2oFZ0IyJ2Om4=";
  };

  build-system = [ setuptools-scm pdm-backend ];

  meta = with lib; {
    description = "A markdown parser with high extensibility.";
    homepage = "https://github.com/frostming/marko/";
    license = licenses.mit;
    maintainers = with lib.maintainers; [ pastly ];
  };
}
