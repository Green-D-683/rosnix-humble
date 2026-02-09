{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot4-ignition-bringup,
  turtlebot4-ignition-gui-plugins,
  turtlebot4-ignition-toolbox,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_simulator";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot4-ignition-bringup turtlebot4-ignition-gui-plugins turtlebot4-ignition-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-ignition-bringup turtlebot4-ignition-gui-plugins turtlebot4-ignition-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_simulator" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_simulator-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "d1e3f70579bcea7bbd10e6be872d8fa6a30e74c1";
        hash = "sha256-yEQKPPp3gZBd2iA9FrZD50ncZZ/hy2JEgmx+H1csDnE=";
      };
    };
  });
  meta = {
    description = "TODO: Package description";
  };
})
