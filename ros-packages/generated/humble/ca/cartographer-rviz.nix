{
  ament-cmake,
  buildAmentCmakePackage,
  cartographer,
  cartographer-ros,
  cartographer-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-ogre-vendor,
  rviz-rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cartographer_rviz";
  version = "2.0.9002-1";
  src = finalAttrs.passthru.sources."cartographer_rviz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cartographer cartographer-ros cartographer-ros-msgs pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libabsl-dev" "libboost-iostreams-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cartographer cartographer-ros cartographer-ros-msgs pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libabsl-dev" "libboost-iostreams-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cartographer_rviz" = substituteSource {
      src = fetchgit {
        name = "cartographer_rviz-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "52167c59138a919f744abbed2c4582779b36df3b";
        hash = "sha256-SYLs4HwfMyRxFT3r+b1js6dWZnlU1+/g6eKDIXxXKLg=";
      };
    };
  });
  meta = {
    description = "\n    Cartographer is a system that provides real-time simultaneous localization\n    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor\n    configurations. This package provides Cartographer's RViz integration.\n  ";
  };
})
