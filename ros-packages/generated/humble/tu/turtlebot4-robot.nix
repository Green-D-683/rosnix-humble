{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot4-base,
  turtlebot4-bringup,
  turtlebot4-diagnostics,
  turtlebot4-tests,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_robot";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot4-base turtlebot4-bringup turtlebot4-diagnostics turtlebot4-tests ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-base turtlebot4-bringup turtlebot4-diagnostics turtlebot4-tests ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_robot" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_robot-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "f648ef08aade30931defacaa7f8d584ca26f44e1";
        hash = "sha256-Wa8sx+XUIJz+JEZKagMuFuFR4vnwKjeCF8cUEQmqPi0=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Robot Metapackage";
  };
})
