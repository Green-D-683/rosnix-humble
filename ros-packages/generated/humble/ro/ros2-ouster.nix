{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  mkSourceSet,
  ouster-msgs,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_ouster";
  version = "0.4.3-1";
  src = finalAttrs.passthru.sources."ros2_ouster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs launch launch-ros ouster-msgs pcl-conversions rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all" "libtins-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs launch launch-ros ouster-msgs pcl-conversions rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all" "libtins-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_ouster" = substituteSource {
      src = fetchgit {
        name = "ros2_ouster-source";
        url = "https://github.com/ros2-gbp/ros2_ouster_drivers-release.git";
        rev = "013c97cd80754a7defc79795457047c5d49ba16d";
        hash = "sha256-2noH0G83OdT62j6e6wKnHql1E6rMn40Glqrd5VOB/zk=";
      };
    };
  });
  meta = {
    description = "ROS2 Drivers for the Ouster OS-1 Lidar";
  };
})
