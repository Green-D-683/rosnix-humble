{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_navigation2";
  version = "2.3.6-1";
  src = finalAttrs.passthru.sources."turtlebot3_navigation2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-bringup ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-bringup ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_navigation2" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_navigation2-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "9a8bd528bf1b3b9db1c018f586b622215073fc47";
        hash = "sha256-fBQnMwLdZcDt6ZweOTj+LMuydBCAnhf4Gr/ByI4vVUE=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for navigation2\n  ";
  };
})
