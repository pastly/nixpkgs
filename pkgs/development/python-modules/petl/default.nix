{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools-scm
 }:

buildPythonPackage rec {
  pname = "petl";
  version = "1.7.15";
  pyproject = true;

  src = fetchFromGitHub rec {
    inherit version;
    owner = "petl-developers";
    repo = "petl";
    rev = "v${version}";
    hash = "sha256-zTE6s19/xcu7noT+qQXYrJ8ldrSQVi3AunDKoOMB2Qs=";
  };

  build-system = [ setuptools-scm ];

  meta = with lib; {
    description = "Python Extract Transform and Load Tables of Data";
    homepage = "https://github.com/petl-developers/petl";
    license = licenses.mit;
    maintainers = with lib.maintainers; [ pastly ];
  };
}
