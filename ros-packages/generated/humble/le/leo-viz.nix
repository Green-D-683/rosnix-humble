{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  leo-description,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_viz";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."leo_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui leo-description rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui leo-description rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "leo_viz" = substituteSource {
      src = fetchgit {
        name = "leo_viz-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "178c856c09c7e7c1e24c64c87823ce66c6fe2e76";
        hash = "sha256-2C7i0bQByR/kwoYKjelPz/+sMAaGyjgSeW0YtgMa8a8=";
      };
    };
  });
  meta = {
    description = "\n    Visualization launch files and RViz configurations for Leo Rover\n  ";
  };
})
