{
  lib,
  buildPythonPackage,
  fetchPypi,
  protobuf,
  grpcio,
  setuptools,
}:

buildPythonPackage rec {
  pname = "grpcio-tools";
  version = "1.64.1";
  format = "setuptools";

  src = fetchPypi {
    pname = "grpcio_tools";
    inherit version;
    hash = "sha256-crNVC5GtuDVGVuzw9tHUYRKZBEuuEfsefMHRu2a4wes=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace 'protobuf>=4.21.6,<5.0dev' 'protobuf'
  '';

  outputs = [
    "out"
    "dev"
  ];

  enableParallelBuilding = true;

  propagatedBuildInputs = [
    protobuf
    grpcio
    setuptools
  ];

  # no tests in the package
  doCheck = false;

  pythonImportsCheck = [ "grpc_tools" ];

  meta = with lib; {
    description = "Protobuf code generator for gRPC";
    license = licenses.asl20;
    homepage = "https://grpc.io/grpc/python/";
    maintainers = with maintainers; [ ];
  };
}
