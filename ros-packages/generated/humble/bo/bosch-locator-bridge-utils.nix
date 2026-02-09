{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-util,
  pcl-conversions,
  rclcpp,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bosch_locator_bridge_utils";
  version = "2.1.15-1";
  src = finalAttrs.passthru.sources."bosch_locator_bridge_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-util nav-msgs pcl-conversions rclcpp std-srvs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-util nav-msgs pcl-conversions rclcpp std-srvs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bosch_locator_bridge_utils" = substituteSource {
      src = fetchgit {
        name = "bosch_locator_bridge_utils-source";
        url = "https://github.com/ros2-gbp/locator_ros_bridge-release.git";
        rev = "9ddc2fab4b95f6f14870580201d3cba1c68902d7";
        hash = "sha256-hq4FjBFuBuz3Qxa8t4oB4vgwGXt0jP9wq2RxOkWzFz4=";
      };
    };
  });
  meta = {
    description = "Utilities to use bosch_locator_bridge with Nav2";
  };
})
