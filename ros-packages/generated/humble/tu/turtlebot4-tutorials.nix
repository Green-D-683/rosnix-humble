{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot4-cpp-tutorials,
  turtlebot4-python-tutorials,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_tutorials";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_tutorials";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot4-cpp-tutorials turtlebot4-python-tutorials ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-cpp-tutorials turtlebot4-python-tutorials ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_tutorials" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_tutorials-source";
        url = "https://github.com/ros2-gbp/turtlebot4_tutorials-release.git";
        rev = "7a072e871a3cfd38423ea6f07411a94271a70af1";
        hash = "sha256-aabhYsCks5EjPKEun9PcUEMwrMX0LbWzlrna1n9inRY=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Tutorials Metapackage";
  };
})
