{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-msgs,
  moveit-planners-ompl,
  moveit-resources-panda-moveit-config,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  pluginlib,
  position-controllers,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  robot-state-publisher,
  ros-testing,
  rosSystemPackages,
  rviz2,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_hybrid_planning";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_hybrid_planning";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp controller-manager moveit-common moveit-core moveit-msgs moveit-resources-panda-moveit-config moveit-ros-planning moveit-ros-planning-interface pluginlib position-controllers rclcpp rclcpp-action rclcpp-components robot-state-publisher rviz2 std-msgs std-srvs tf2-ros trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp controller-manager moveit-common moveit-core moveit-msgs moveit-resources-panda-moveit-config moveit-ros-planning moveit-ros-planning-interface pluginlib position-controllers rclcpp rclcpp-action rclcpp-components robot-state-publisher rviz2 std-msgs std-srvs tf2-ros trajectory-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common moveit-planners-ompl ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_hybrid_planning" = substituteSource {
      src = fetchgit {
        name = "moveit_hybrid_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "db55cf8086794cc2f9d74a6ea673c32022add554";
        hash = "sha256-Ia8qjd6+AFm5FObxcS3nDaHuj2tqH+vi8Wqc4AG9uPE=";
      };
    };
  });
  meta = {
    description = "Hybrid planning components of MoveIt 2";
  };
})
