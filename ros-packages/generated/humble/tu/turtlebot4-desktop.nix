{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot4-viz,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_desktop";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."turtlebot4_desktop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot4-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-viz ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_desktop" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_desktop-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
        rev = "a35838ecb2a91d884106f74da7a85370280c866e";
        hash = "sha256-R9RZQK2umArCV3tbR4gaUyc7Pfp9cQtFc7Lm+/8d1lU=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Desktop Metapackage";
  };
})
