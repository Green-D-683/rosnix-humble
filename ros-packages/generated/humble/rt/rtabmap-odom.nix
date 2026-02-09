{
  ament-cmake-ros,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  laser-geometry,
  message-filters,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  pcl-ros,
  pluginlib,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  rtabmap-sync,
  rtabmap-util,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_odom";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_odom";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge image-geometry laser-geometry message-filters nav-msgs pcl-conversions pcl-ros pluginlib rclcpp rclcpp-components ros-environment rtabmap-conversions rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge image-geometry laser-geometry message-filters nav-msgs pcl-conversions pcl-ros pluginlib rclcpp rclcpp-components ros-environment rtabmap-conversions rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_odom" = substituteSource {
      src = fetchgit {
        name = "rtabmap_odom-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "d3bb97b265c74e3a1411d3892e15634a2dc15f79";
        hash = "sha256-tNOs86SH4dDVOGNEQjWXDPKIAdz+H32WHwpajWuFRAA=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's odometry package.";
  };
})
