{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2service,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2param";
  version = "0.18.16-1";
  src = finalAttrs.passthru.sources."ros2param";
  propagatedNativeBuildInputs = [ rcl-interfaces rclpy ros2cli ros2node ros2service ];
  propagatedBuildInputs = [ rcl-interfaces rclpy ros2cli ros2node ros2service ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2param" = substituteSource {
      src = fetchgit {
        name = "ros2param-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "d538c90e79b297c1b281ffce6a4f1fabe2017f01";
        hash = "sha256-aJOAwF+buJOYUycxh6gl6vE6FfEzlKojb9wvDUy1X9c=";
      };
    };
  });
  meta = {
    description = "\n    The param command for ROS 2 command line tools.\n  ";
  };
})
