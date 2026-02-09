{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-filter-madgwick,
  mkSourceSet,
  realsense2-camera,
  rosSystemPackages,
  rtabmap-odom,
  rtabmap-rviz-plugins,
  rtabmap-slam,
  rtabmap-util,
  rtabmap-viz,
  substituteSource,
  tf2-ros,
  velodyne,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_examples";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ imu-filter-madgwick realsense2-camera rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz tf2-ros velodyne ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ imu-filter-madgwick realsense2-camera rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz tf2-ros velodyne ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_examples" = substituteSource {
      src = fetchgit {
        name = "rtabmap_examples-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "367050be6dc3b4f263f37094f66125c43b0d1742";
        hash = "sha256-z3l7xGALAaeArUe2vVGNDWPvqsZ+zI+fKmXdaa0XZLM=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's example launch files.";
  };
})
