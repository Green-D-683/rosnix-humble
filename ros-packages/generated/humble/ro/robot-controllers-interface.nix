{
  ament-cmake,
  ament-cmake-cpplint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-action,
  robot-controllers-msgs,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_controllers_interface";
  version = "0.9.3-1";
  src = finalAttrs.passthru.sources."robot_controllers_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib rclcpp rclcpp-action robot-controllers-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rclcpp rclcpp-action robot-controllers-msgs tf2-ros ];
  checkInputs = [ ament-cmake-cpplint ];
  passthru.sources = mkSourceSet (sources: {
    "robot_controllers_interface" = substituteSource {
      src = fetchgit {
        name = "robot_controllers_interface-source";
        url = "https://github.com/fetchrobotics-gbp/robot_controllers-ros2-release.git";
        rev = "cc21bd5f5f6dc30ab6976b287807fd447a3b9a61";
        hash = "sha256-RnV2xz0xdp3ejwJr9rHTKXhBc3FzfCEHIJwGwqrNZ7o=";
      };
    };
  });
  meta = {
    description = "\n    Generic framework for robot controls.\n  ";
  };
})
