{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-viz,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_desktop";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."leo_desktop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ leo leo-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-viz ];
  passthru.sources = mkSourceSet (sources: {
    "leo_desktop" = substituteSource {
      src = fetchgit {
        name = "leo_desktop-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "7f8da2e52c90201797759a4d19edfc7357ccd597";
        hash = "sha256-YVpdlrpasTNSWYO4smQTr6VvaFBfuTFQn1snucaRQmw=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage of software for operating Leo Rover from ROS desktop\n  ";
  };
})
