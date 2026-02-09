{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_index_python";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."ament_index_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_index_python" = substituteSource {
      src = fetchgit {
        name = "ament_index_python-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "85404c5cb56ce1873afca544436b36e3003d5ec8";
        hash = "sha256-9iod+b1BuNoIvSFof6K/7g9FB+i5bA3KxqBDuQPjjGc=";
      };
    };
  });
  meta = {
    description = "\n    Python API to access the ament resource index.\n  ";
  };
})
