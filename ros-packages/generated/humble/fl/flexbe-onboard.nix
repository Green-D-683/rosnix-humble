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
  flexbe-states,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_onboard";
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."flexbe_onboard";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_onboard" = substituteSource {
      src = fetchgit {
        name = "flexbe_onboard-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "e5b7692945ff50aa61bcd521be40e24fb79efd91";
        hash = "sha256-oAJBvTXjQBTbfApcOPVBhIYTilzEcSJURifbrFjYjgA=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_onboard implements the robot-side of the behavior engine from where all behaviors are started.\n    ";
  };
})
