{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros2cli,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2plugin";
  version = "5.1.3-1";
  src = finalAttrs.passthru.sources."ros2plugin";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli ros2pkg ];
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2plugin" = substituteSource {
      src = fetchgit {
        name = "ros2plugin-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "56ce635346209f934c4934d5ff8cb0384fece015";
        hash = "sha256-iTGDiTNWfZF/R9q9CmY2vBtKk4zyjGDr2xMfvJeisYQ=";
      };
    };
  });
  meta = {
    description = "\n    The plugin command for ROS 2 command line tools.\n  ";
  };
})
