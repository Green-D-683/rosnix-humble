{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  robot-state-publisher,
  ros-testing,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "synapticon_ros2_control";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."synapticon_ros2_control";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-trajectory-controller pluginlib rclcpp rclcpp-lifecycle robot-state-publisher ros2controlcli ros2launch rviz2 xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcap-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-trajectory-controller pluginlib rclcpp rclcpp-lifecycle robot-state-publisher ros2controlcli ros2launch rviz2 xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gtest ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "synapticon_ros2_control" = substituteSource {
      src = fetchgit {
        name = "synapticon_ros2_control-source";
        url = "https://github.com/synapticon/synapticon_ros2_control-release.git";
        rev = "def7ab7e9ad882ddf24ea6dc1e6bc46ebe5896c4";
        hash = "sha256-tolhwepTrW94wiMZ5zyAgmE0X8QFiIFFkAT2zpa4hvE=";
      };
    };
  });
  meta = {
    description = "A ros2_control interface for Synapticon motor drivers";
  };
})
