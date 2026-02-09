{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric-shapes,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-msgs,
  octomap,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_occupancy_map_monitor";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_ros_occupancy_map_monitor";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometric-shapes moveit-common moveit-core moveit-msgs octomap pluginlib rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module geometric-shapes moveit-common moveit-core moveit-msgs octomap pluginlib rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_occupancy_map_monitor" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_occupancy_map_monitor-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "90ea4b5c70e730b070f236c65beb68e156b4ed82";
        hash = "sha256-8tW+DqMcXs4jcQ7hbW3G7Lmae5zFS3gmEotDqtdV8MQ=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to occupancy map";
  };
})
