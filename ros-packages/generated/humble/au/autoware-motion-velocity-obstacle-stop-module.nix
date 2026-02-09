{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-motion-velocity-planner,
  autoware-motion-velocity-planner-common,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-utils-debug,
  autoware-utils-geometry,
  autoware-utils-rclcpp,
  autoware-utils-system,
  autoware-utils-uuid,
  autoware-utils-visualization,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_motion_velocity_obstacle_stop_module";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_motion_velocity_obstacle_stop_module";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-planning-msgs autoware-motion-utils autoware-motion-velocity-planner autoware-motion-velocity-planner-common autoware-perception-msgs autoware-planning-msgs autoware-utils-debug autoware-utils-geometry autoware-utils-rclcpp autoware-utils-system autoware-utils-uuid autoware-utils-visualization autoware-vehicle-info-utils geometry-msgs grid-map-core pluginlib rclcpp tf2 visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-planning-msgs autoware-motion-utils autoware-motion-velocity-planner autoware-motion-velocity-planner-common autoware-perception-msgs autoware-planning-msgs autoware-utils-debug autoware-utils-geometry autoware-utils-rclcpp autoware-utils-system autoware-utils-uuid autoware-utils-visualization autoware-vehicle-info-utils geometry-msgs grid-map-core pluginlib rclcpp tf2 visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_motion_velocity_obstacle_stop_module" = substituteSource {
      src = fetchgit {
        name = "autoware_motion_velocity_obstacle_stop_module-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "83a55400da0a9420be7e8498ee13dfd791e95669";
        hash = "sha256-lvgtCgum8BORLeJOFtcWyjSxoH6NwMKxwjt82FnHbNs=";
      };
    };
  });
  meta = {
    description = "obstacle stop feature in motion_velocity_planner";
  };
})
