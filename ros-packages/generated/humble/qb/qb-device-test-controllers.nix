{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "qb_device_test_controllers";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."qb_device_test_controllers";
  propagatedNativeBuildInputs = [ rclpy std-msgs trajectory-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs trajectory-msgs ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qb_device_test_controllers" = substituteSource {
      src = fetchgit {
        name = "qb_device_test_controllers-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "35d3efddba28dfce58527351ba131ee2472d26b7";
        hash = "sha256-/G5g5E8TBQXqgs+AQQDd+FYD00v9Fh/NjsdLJXU872k=";
      };
    };
  });
  meta = {
    description = "Demo nodes for showing and testing qb devices through waypoints.";
  };
})
