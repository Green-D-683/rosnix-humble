{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  navigation2,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_navigation2";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_navigation2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ navigation2 rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ navigation2 rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_navigation2" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_navigation2-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "f3075f6f016a33c300309c99ce86c32cfef1c3f6";
        hash = "sha256-5gdjIU+RzsFYrYMcBls5U+EN5yLoW7xsKKZIm67PlqU=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for navigation2\n  ";
  };
})
