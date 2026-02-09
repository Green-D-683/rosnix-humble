{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-panda-moveit-config,
  moveit-ros-occupancy-map-monitor,
  pluginlib,
  rclcpp,
  rclcpp-action,
  ros-testing,
  rosSystemPackages,
  srdfdom,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
  urdf,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_planning";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_ros_planning";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp eigen3-cmake-module message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor pluginlib rclcpp rclcpp-action srdfdom tf2 tf2-eigen tf2-geometry-msgs tf2-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp eigen3-cmake-module message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor pluginlib rclcpp rclcpp-action srdfdom tf2 tf2-eigen tf2-geometry-msgs tf2-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common moveit-configs-utils moveit-resources-panda-moveit-config ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_planning" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "152f22ce10d1dae2280e403666bbdb599fb5f25e";
        hash = "sha256-ebWISeetXuJ1Y30VlALbnVQtTOYN5XY8bl47UeGlmMo=";
      };
    };
  });
  meta = {
    description = "Planning components of MoveIt that use ROS";
  };
})
