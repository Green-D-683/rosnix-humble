{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot3-fake-node,
  turtlebot3-gazebo,
  turtlebot3-manipulation-gazebo,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_simulations";
  version = "2.3.8-1";
  src = finalAttrs.passthru.sources."turtlebot3_simulations";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot3-fake-node turtlebot3-gazebo turtlebot3-manipulation-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot3-fake-node turtlebot3-gazebo turtlebot3-manipulation-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_simulations" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_simulations-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "65222273a3471e8cceacee15144a8038391922e7";
        hash = "sha256-rI+qiw1y1EidjojJhou4vHXGLLV0T8ob0rL3q5lDVcw=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 packages for TurtleBot3 simulations\n  ";
  };
})
