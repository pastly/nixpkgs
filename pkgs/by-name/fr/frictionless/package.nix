{ lib
, python312Packages
, fetchPypi
}:
with python312Packages;
buildPythonApplication rec {
  pname = "frictionless";
  version = "5.17.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash  = "sha256-vuSp8Hb6sV5GJ3LQnTpJa1DXPsXsuSfZe5MH7q78bTw=";
  };

  build-system = [
    setuptools
    wheel
  ];

  buildInputs = [ hatchling ];

  dependencies = [
    petl
    marko
    attrs
    jinja2
    pyyaml
    isodate
    rfc3986
    chardet
    pydantic
    requests
    humanize
    tabulate
    jsonschema
    simpleeval
    stringcase
    typer
    validators
    python-slugify
    python-dateutil
    typing-extensions
  ];

  meta = {
    # ...
  };
}
