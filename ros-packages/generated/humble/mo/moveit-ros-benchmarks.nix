{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-param-builder,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-ros-planning,
  moveit-ros-warehouse,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_benchmarks";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_ros_benchmarks";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-param-builder moveit-common moveit-configs-utils moveit-core moveit-ros-planning moveit-ros-warehouse pluginlib rclcpp tf2-eigen ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-param-builder moveit-common moveit-configs-utils moveit-core moveit-ros-planning moveit-ros-warehouse pluginlib rclcpp tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_benchmarks" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_benchmarks-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c6e4a515460b0680bc8ac1eddda53d1cfe10cedb";
        hash = "sha256-ADNrIWS1p2l7QHO/INIVcMh+OkzkDrCRa670FP+Y1Hs=";
      };
    };
  });
  meta = {
    description = "Enhanced tools for benchmarks in MoveIt";
  };
})
