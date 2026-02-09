{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pluginlib,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_rviz_plugins";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pcl-conversions pluginlib rclcpp ros-environment rtabmap-conversions rtabmap-msgs rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs tf2 ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pcl-conversions pluginlib rclcpp ros-environment rtabmap-conversions rtabmap-msgs rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "rtabmap_rviz_plugins-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "e227e8a55772862117e868747955365f8e3e1ea9";
        hash = "sha256-ufZXI9iLKgvjTeNv+OzAMtUpKuB0D7YPUuhMvU6Zeqk=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's rviz plugins.";
  };
})
