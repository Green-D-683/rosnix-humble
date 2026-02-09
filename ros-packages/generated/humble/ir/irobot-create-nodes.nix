{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  angles,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-msgs,
  irobot-create-toolbox,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_nodes";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_nodes";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles control-msgs geometry-msgs irobot-create-msgs irobot-create-toolbox nav-msgs rclcpp rclcpp-action rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles control-msgs geometry-msgs irobot-create-msgs irobot-create-toolbox nav-msgs rclcpp rclcpp-action rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_nodes" = substituteSource {
      src = fetchgit {
        name = "irobot_create_nodes-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "2b7b267706218bfcfd2103af5cdb589a165cccf1";
        hash = "sha256-Cr1nAo4G7H5nAcW5zRMzQ+q/LoKdWZbqPlpnb1BXbKU=";
      };
    };
  });
  meta = {
    description = "ROS 2 Nodes for the simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
})
