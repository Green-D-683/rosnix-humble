{
  ament-cmake-ros,
  buildAmentCmakePackage,
  color-util,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  polygon-msgs,
  polygon-utils,
  rosSystemPackages,
  rviz-common,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "polygon_rviz_plugins";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."polygon_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ color-util geometry-msgs pluginlib polygon-msgs polygon-utils rviz-common std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ color-util geometry-msgs pluginlib polygon-msgs polygon-utils rviz-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "polygon_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "polygon_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "2a460e9df27463ec738e4655c7de90f169509efb";
        hash = "sha256-MBvbUxknfjvwHnTRP93MAJrqlCcPo+3YxrmRvgc61xU=";
      };
    };
  });
  meta = {
    description = "RViz visualizations for polygons";
  };
})
