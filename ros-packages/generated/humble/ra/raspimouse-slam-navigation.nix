{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  raspimouse-navigation,
  raspimouse-slam,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_slam_navigation";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."raspimouse_slam_navigation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ raspimouse-navigation raspimouse-slam ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raspimouse-navigation raspimouse-slam ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_slam_navigation" = substituteSource {
      src = fetchgit {
        name = "raspimouse_slam_navigation-source";
        url = "https://github.com/ros2-gbp/raspimouse_slam_navigation_ros2-release.git";
        rev = "07d5603fac2515ad55bb0088e891d76776b0f783";
        hash = "sha256-vuVfKh35KBPaeS1AQQmPdy9lJYdc2urtYmqCrMlwZ90=";
      };
    };
  });
  meta = {
    description = "SLAM and navigation packages for Raspberry Pi Mouse V3";
  };
})
