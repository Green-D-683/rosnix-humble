{
  action-msgs,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  weight-scale-interfaces,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "aandd_ekew_driver_py";
  version = "0.0.2-3";
  src = finalAttrs.passthru.sources."aandd_ekew_driver_py";
  propagatedNativeBuildInputs = [ action-msgs rclpy weight-scale-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-serial" ]; };
  propagatedBuildInputs = [ action-msgs rclpy weight-scale-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "aandd_ekew_driver_py" = substituteSource {
      src = fetchgit {
        name = "aandd_ekew_driver_py-source";
        url = "https://github.com/ros2-gbp/aandd_ekew_driver_py-release.git";
        rev = "528affc79fa3d65174e5784a404eb0d14be995c1";
        hash = "sha256-8WW7GCR9IFM7AA7DlOdURW8bhelPxZcjteY9JtEWs3s=";
      };
    };
  });
  meta = {
    description = "aandd ek/ew series driver python package";
  };
})
