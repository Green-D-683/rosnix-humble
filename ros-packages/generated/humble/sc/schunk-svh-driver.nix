{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-ros,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros2launch,
  rosSystemPackages,
  schunk-svh-description,
  schunk-svh-library,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "schunk_svh_driver";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."schunk_svh_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-manager hardware-interface joint-state-broadcaster joint-trajectory-controller launch launch-ros pluginlib rclcpp ros2launch schunk-svh-description schunk-svh-library xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager hardware-interface joint-state-broadcaster joint-trajectory-controller launch launch-ros pluginlib rclcpp ros2launch schunk-svh-description schunk-svh-library xacro ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "schunk_svh_driver" = substituteSource {
      src = fetchgit {
        name = "schunk_svh_driver-source";
        url = "https://github.com/ros2-gbp/schunk_svh_ros_driver-release.git";
        rev = "ba9f7ace87db26e192455618f09788bbc05d4d63";
        hash = "sha256-0buDyivyqoRlMN5xkODA39xheWF5+ygyRutVPubIXWc=";
      };
    };
  });
  meta = {
    description = "ROS2-control system interface for the Schunk SVH";
  };
})
