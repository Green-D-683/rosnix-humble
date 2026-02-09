{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-behavior-velocity-planner,
  autoware-behavior-velocity-planner-common,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lanelet2-extension,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-route-handler,
  autoware-trajectory,
  autoware-utils-debug,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_behavior_velocity_stop_line_module";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_behavior_velocity_stop_line_module";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-behavior-velocity-planner autoware-behavior-velocity-planner-common autoware-internal-planning-msgs autoware-lanelet2-extension autoware-motion-utils autoware-route-handler autoware-trajectory autoware-utils-debug geometry-msgs pluginlib rclcpp tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-behavior-velocity-planner autoware-behavior-velocity-planner-common autoware-internal-planning-msgs autoware-lanelet2-extension autoware-motion-utils autoware-route-handler autoware-trajectory autoware-utils-debug geometry-msgs pluginlib rclcpp tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_behavior_velocity_stop_line_module" = substituteSource {
      src = fetchgit {
        name = "autoware_behavior_velocity_stop_line_module-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "29838e2de23823453c171af4acd8070e67b185da";
        hash = "sha256-4KtblfS19zhhqK4/SWfGbR89j6SLBLc5YptA0uvw+ow=";
      };
    };
  });
  meta = {
    description = "The autoware_behavior_velocity_stop_line_module package";
  };
})
