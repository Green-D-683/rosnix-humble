{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  nav2-simple-commander,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_navigation";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot4_navigation";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-bringup nav2-simple-commander slam-toolbox ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ nav2-bringup nav2-simple-commander slam-toolbox ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_navigation" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_navigation-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "e40a22acdcc1bb0f0d3323a33b342b69d18f4ca7";
        hash = "sha256-TQtUW4KsbMqbChRrU1avtgz2g8QCRrrIRhm/n91V2vs=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Navigation";
  };
})
