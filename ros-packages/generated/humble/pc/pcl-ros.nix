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
  pcl-conversions,
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
  pname = "pcl_ros";
  version = "2.4.5-2";
  src = finalAttrs.passthru.sources."pcl_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-features" "libpcl-filters" "libpcl-io" "libpcl-segmentation" "libpcl-surface" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-features" "libpcl-filters" "libpcl-io" "libpcl-segmentation" "libpcl-surface" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pcl_ros" = substituteSource {
      src = fetchgit {
        name = "pcl_ros-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "5ff892b9f4d80a4a1c5d6d1c2f8dfd96dd30c618";
        hash = "sha256-8MALWETbLb5TRQ7BIfdGDsGi4th4jfPJlSWQT6MRe5w=";
      };
    };
  });
  meta = {
    description = "\n\n  PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred\n  bridge for 3D applications involving n-D Point Clouds and 3D geometry\n  processing in ROS.\n\n  ";
  };
})
