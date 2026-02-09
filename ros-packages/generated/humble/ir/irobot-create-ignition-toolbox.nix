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
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  irobot-create-toolbox,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rcutils,
  ros-ign-interfaces,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_ignition_toolbox";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_ignition_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ control-msgs irobot-create-msgs irobot-create-toolbox nav-msgs rclcpp rclcpp-action rcutils ros-ign-interfaces sensor-msgs std-msgs tf2 tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs irobot-create-msgs irobot-create-toolbox nav-msgs rclcpp rclcpp-action rcutils ros-ign-interfaces sensor-msgs std-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_ignition_toolbox" = substituteSource {
      src = fetchgit {
        name = "irobot_create_ignition_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "51ee88435f72c2c0551a0a9812baf260267bd5ef";
        hash = "sha256-45d/oiXqVU4VP7u7Gi5X/RuYeWy+jps+ZZcVi5tMhuM=";
      };
    };
  });
  meta = {
    description = "Nodes and tools for simulating in Ignition iRobot(R) Create(R) 3 Educational Robot.";
  };
})
