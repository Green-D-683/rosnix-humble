{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_input";
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."flexbe_input";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_input" = substituteSource {
      src = fetchgit {
        name = "flexbe_input-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "953d14794a4175f566e7cc23de1253b09fddfcc5";
        hash = "sha256-pPzMpRE90PP4oQ26SxWCx9yQsVLe65wZ3hCekdAyulo=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_input enables to send data to onboard behavior when required.\n    ";
  };
})
