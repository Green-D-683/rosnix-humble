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
  sensor-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "sensor_msgs_py";
  version = "4.9.0-1";
  src = finalAttrs.passthru.sources."sensor_msgs_py";
  propagatedNativeBuildInputs = [ sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sensor_msgs_py" = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "fd082cd05e506290ffbd32f99ac3408880007e5a";
        hash = "sha256-Hh4KRHE6HMoB2AOpPeXtHoKBD92hRQdKnneOv8thIDE=";
      };
    };
  });
  meta = {
    description = "A package for easy creation and reading of PointCloud2 messages in Python.";
  };
})
