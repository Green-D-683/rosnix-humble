{
  action-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav2-behavior-tree,
  nav2-costmap-2d,
  nav2-map-server,
  nav2-msgs,
  nav2-navfn-planner,
  nav2-theta-star-planner,
  nav2-util,
  pcl-ros,
  pluginlib,
  rclcpp,
  rclcpp-action,
  roadmap-explorer-msgs,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "roadmap_explorer";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."roadmap_explorer";
  propagatedNativeBuildInputs = [ action-msgs ament-cmake geometry-msgs nav2-behavior-tree nav2-costmap-2d nav2-map-server nav2-msgs nav2-navfn-planner nav2-theta-star-planner nav2-util pcl-ros pluginlib rclcpp rclcpp-action roadmap-explorer-msgs ros-environment rosidl-default-generators sensor-msgs tf2 tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "nlohmann-json-dev" ]; };
  propagatedBuildInputs = [ action-msgs ament-cmake geometry-msgs nav2-behavior-tree nav2-costmap-2d nav2-map-server nav2-msgs nav2-navfn-planner nav2-theta-star-planner nav2-util pcl-ros pluginlib rclcpp rclcpp-action roadmap-explorer-msgs ros-environment rosidl-default-generators sensor-msgs tf2 tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "roadmap_explorer" = substituteSource {
      src = fetchgit {
        name = "roadmap_explorer-source";
        url = "https://github.com/ros2-gbp/roadmap_explorer-release.git";
        rev = "a93cb00c0e5da043ab18529cdbf054ccd6a312a9";
        hash = "sha256-A2fg4Q0hV4nu3EM2z4amTqheto5GQRHNVqKffCdI4qs=";
      };
    };
  });
  meta = {
    description = "The roadmap explorer package";
  };
})
