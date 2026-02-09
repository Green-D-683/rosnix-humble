{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-xml,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bosch_locator_bridge";
  version = "2.1.15-1";
  src = finalAttrs.passthru.sources."bosch_locator_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs launch-xml nav-msgs pcl-conversions rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-srvs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpoco-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs launch-xml nav-msgs pcl-conversions rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-srvs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpoco-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bosch_locator_bridge" = substituteSource {
      src = fetchgit {
        name = "bosch_locator_bridge-source";
        url = "https://github.com/ros2-gbp/locator_ros_bridge-release.git";
        rev = "c6f9dd80fb8ca1596a5efcfdd60a1981674b956a";
        hash = "sha256-oNJH5khK+F9x81IYAekgbvWWi/61N3zukOvDGi95m0U=";
      };
    };
  });
  meta = {
    description = "ROS interface to Rexroth ROKIT Locator";
  };
})
