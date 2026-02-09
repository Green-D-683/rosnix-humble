{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-costmap-2d,
  nav2-util,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_collision_monitor";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."nav2_collision_monitor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-costmap-2d nav2-util rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-costmap-2d nav2-util rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_collision_monitor" = substituteSource {
      src = fetchgit {
        name = "nav2_collision_monitor-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "64ffcefbb95388caa49d38805b56cbaf260e9869";
        hash = "sha256-cDHjDRdkgS3bXlrRkM3WwNCI5NJq4StXr7zSsfUaE6E=";
      };
    };
  });
  meta = {
    description = "Collision Monitor";
  };
})
