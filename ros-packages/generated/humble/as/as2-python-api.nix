{
  action-msgs,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  as2-motion-reference-handlers,
  as2-msgs,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "as2_python_api";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_python_api";
  propagatedNativeBuildInputs = [ action-msgs as2-motion-reference-handlers as2-msgs geographic-msgs geometry-msgs nav-msgs rclpy sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pydantic" "python3-pymap3d" ]; };
  propagatedBuildInputs = [ action-msgs as2-motion-reference-handlers as2-msgs geographic-msgs geometry-msgs nav-msgs rclpy sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydantic" "python3-pymap3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "as2_python_api" = substituteSource {
      src = fetchgit {
        name = "as2_python_api-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "e971a75320b8423000ac97cfcce54b4f77508555";
        hash = "sha256-TYJ4QwJ5opGuWHIEChD/CYYQcJFZ6vO84gCTyAUZZJg=";
      };
    };
  });
  meta = {
    description = "AeroStack2 drone interface tool in python";
  };
})
