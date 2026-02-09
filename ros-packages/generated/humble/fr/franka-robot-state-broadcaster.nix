{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-msgs,
  franka-semantic-components,
  generate-parameter-library,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_robot_state_broadcaster";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_robot_state_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface franka-msgs franka-semantic-components generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface franka-msgs franka-semantic-components generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface rclcpp ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "franka_robot_state_broadcaster" = substituteSource {
      src = fetchgit {
        name = "franka_robot_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "3e0dc9752932d90883e834e952f365ef3efc57ab";
        hash = "sha256-C+yhnVuWizUA/m8ZLNSYLmXBAYHrz3iRJKKz5mdqrFc=";
      };
    };
  });
  meta = {
    description = "Broadcaster to publish robot states";
  };
})
