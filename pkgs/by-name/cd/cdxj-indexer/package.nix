{ lib
, python312Packages
, fetchFromGitHub
}:
with python312Packages;
buildPythonApplication rec {
  pname = "cdxj-indexer";
  # made up version as upstream project has no released version
  version = "2024-06-23";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "webrecorder";
    repo = "cdxj-indexer";
    # master branch commit as of 2024-06-23
    rev = "3df3bbc7eb842ad11f99e715bd181d9de98a7b9d";
    hash  = "sha256-+oCyjhH+wF+gvpNMOaImoU+fm4qd9RQ7Be17zoYR6XM=";
  };

  nativeCheckInputs = [ pytest pytest-cov ];

  # pulled from upstream's setup.py
  checkPhase = ''
    pytest --doctest-modules ./cdxj_indexer --cov cdxj_indexer -v test/
  '';

  propagatedBuildInputs = [
    warcio
    surt
    py3amf
  ];

  meta = with lib; {
    description = "CDXJ Indexing of WARC/ARCs";
    homepage = "https://github.com/webrecorder/cdxj-indexer/";
    license = licenses.asl20;
    maintainers = with lib.maintainers; [ pastly ];
    mainProgram = "cdxj-indexer";
  };
}

