{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, setuptools-scm
, pdm-backend
 }:

buildPythonPackage rec {
  pname = "py3amf";
  version = "0.8.11";
  format = "setuptools";

  src = fetchFromGitHub rec {
    inherit version;
    owner = "StdCarrot";
    repo = "Py3AMF";
    rev = "v${version}";
    hash = "sha256-9zuHh5+ggIjv1LcjpBNHy2yh09KsFpxUdGrtKGm94Zg=";
  };

  doCheck = false;

  meta = with lib; {
    description = " AMF for Python 3";
    homepage = "https://github.com/StdCarrot/Py3AMF/";
    license = licenses.mit;
    maintainers = with lib.maintainers; [ pastly ];
  };
}

