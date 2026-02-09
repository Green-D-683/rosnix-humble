{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  grid-map-ros,
  image-transport,
  laser-geometry,
  message-filters,
  mkSourceSet,
  nav-msgs,
  octomap-msgs,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_util";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_util";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge grid-map-ros image-transport laser-geometry message-filters nav-msgs octomap-msgs pcl-conversions pcl-ros rclcpp rclcpp-components ros-environment rtabmap-conversions rtabmap-msgs sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge grid-map-ros image-transport laser-geometry message-filters nav-msgs octomap-msgs pcl-conversions pcl-ros rclcpp rclcpp-components ros-environment rtabmap-conversions rtabmap-msgs sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_util" = substituteSource {
      src = fetchgit {
        name = "rtabmap_util-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "ff0d550d67db6e4cccde82a79b42761e736838af";
        hash = "sha256-MM09IJOwtStBxIKhEobC6QnL7uCa1Uau5IQxEd8hWks=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's various useful nodes and nodelets.";
  };
})
