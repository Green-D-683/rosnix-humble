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
  joint-state-publisher-gui,
  joint-trajectory-controller,
  mkSourceSet,
  pluginlib,
  qb-softhand-industry-msgs,
  qb-softhand-industry-srvs,
  rclcpp,
  rclcpp-lifecycle,
  robot-state-publisher,
  ros2-controllers-test-nodes,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  transmission-interface,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_softhand_industry_ros2_control";
  version = "2.1.2-4";
  src = finalAttrs.passthru.sources."qb_softhand_industry_ros2_control";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-state-publisher-gui joint-trajectory-controller pluginlib qb-softhand-industry-msgs qb-softhand-industry-srvs rclcpp rclcpp-lifecycle robot-state-publisher ros2-controllers-test-nodes ros2controlcli ros2launch rviz2 transmission-interface xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-state-publisher-gui joint-trajectory-controller pluginlib qb-softhand-industry-msgs qb-softhand-industry-srvs rclcpp rclcpp-lifecycle robot-state-publisher ros2-controllers-test-nodes ros2controlcli ros2launch rviz2 transmission-interface xacro ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "qb_softhand_industry_ros2_control" = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_ros2_control-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "a5a4951989afebf8fb8249771f0328562ee4b3d2";
        hash = "sha256-1Di2yWEnL94/mBE5fF2Zb7+U3JL2h5GdVUbkURlqL3M=";
      };
    };
  });
  meta = {
    description = "Package of `ros2_control` hardware for qbSoftHand Industry with transmission interface.";
  };
})
