{
  ament-cmake,
  ament-cmake-cpplint,
  ament-cmake-gtest,
  angles,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  kdl-parser,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  robot-controllers-interface,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  trajectory-msgs,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_controllers";
  version = "0.9.3-1";
  src = finalAttrs.passthru.sources."robot_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles control-msgs geometry-msgs kdl-parser nav-msgs pluginlib rclcpp rclcpp-action robot-controllers-interface sensor-msgs std-msgs tf2-geometry-msgs tf2-ros trajectory-msgs urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liborocos-kdl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles control-msgs geometry-msgs kdl-parser nav-msgs pluginlib rclcpp rclcpp-action robot-controllers-interface sensor-msgs std-msgs tf2-geometry-msgs tf2-ros trajectory-msgs urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liborocos-kdl-dev" ]; };
  checkInputs = [ ament-cmake-cpplint ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "robot_controllers" = substituteSource {
      src = fetchgit {
        name = "robot_controllers-source";
        url = "https://github.com/fetchrobotics-gbp/robot_controllers-ros2-release.git";
        rev = "d66b0d3775796b3b90f7af6689062931683ea73a";
        hash = "sha256-CW/MOZq5Lr+ookyxZHNH4xoBmG7I9gfRf+/28JicDNM=";
      };
    };
  });
  meta = {
    description = "\n    Some basic robot controllers for use with robot_controllers_interface.\n  ";
  };
})
