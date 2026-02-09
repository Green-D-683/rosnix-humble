{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hls-lfcd-lds-driver,
  mkSourceSet,
  nav2-bringup,
  raspimouse,
  raspimouse-slam,
  rosSystemPackages,
  rplidar-ros,
  rviz2,
  substituteSource,
  urg-node,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_navigation";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."raspimouse_navigation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ hls-lfcd-lds-driver nav2-bringup raspimouse raspimouse-slam rplidar-ros rviz2 urg-node ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ hls-lfcd-lds-driver nav2-bringup raspimouse raspimouse-slam rplidar-ros rviz2 urg-node ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_navigation" = substituteSource {
      src = fetchgit {
        name = "raspimouse_navigation-source";
        url = "https://github.com/ros2-gbp/raspimouse_slam_navigation_ros2-release.git";
        rev = "380c2be291c396b2d49add0f62076e8f0e81f08f";
        hash = "sha256-FRlSW5imRyO/tMJqBD0pK8LE2nkRLCocp68wfa+ZX+o=";
      };
    };
  });
  meta = {
    description = "Navigation package for Raspberry Pi Mouse";
  };
})
