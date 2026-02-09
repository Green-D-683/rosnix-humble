{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-robot-monitor,
  rviz2,
  substituteSource,
  turtlebot4-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_viz";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."turtlebot4_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rqt-robot-monitor rviz2 turtlebot4-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rqt-robot-monitor rviz2 turtlebot4-description ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_viz" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_viz-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
        rev = "d73ef3a62d0786a92c5d97eaa8d490a83eb74a81";
        hash = "sha256-nH7Y+3+zGDTHOsSApAV3eCu2LfzSzcbZIwsSDgT8Ppk=";
      };
    };
  });
  meta = {
    description = "Visualization launchers and helpers for Turtlebot4";
  };
})
