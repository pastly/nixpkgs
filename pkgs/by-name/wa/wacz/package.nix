{ lib
, python312Packages
, fetchFromGitHub
, frictionless
, cdxj-indexer
}:
with python312Packages;
buildPythonApplication rec {
  pname = "wacz";
  version = "0.5.0";
  format = "setuptools";

  src = fetchFromGitHub rec {
    owner = "webrecorder";
    repo = "py-wacz";
    rev = "v${version}";
    hash = "sha256-bGY6G7qBAN1Vu+pTNqRG0xh34sR62pMhQFHFGlJaTPQ=";
  };

  buildInputs = [
    pytest-runner
  ];

  propagatedBuildInputs = [
    frictionless
    shortuuid
    cdxj-indexer
    boilerpy3
    pytest-cov
    pyyaml
    black
    jsonlines
    click
    typer
  ];

  doCheck = false;

  meta = with lib; {
    description = "Python module and command line utility for working with web archive data using the WACZ format specification";
    homepage = "https://github.com/webrecorder/py-wacz";
    maintainers = with maintainers; [ ];
    license = licenses.mit;
  };
}
