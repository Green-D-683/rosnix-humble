{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  message-filters,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  turtlesim,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtle_tf2_cpp";
  version = "0.3.7-1";
  src = finalAttrs.passthru.sources."turtle_tf2_cpp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs launch launch-ros message-filters rclcpp tf2 tf2-geometry-msgs tf2-ros turtlesim ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs launch launch-ros message-filters rclcpp tf2 tf2-geometry-msgs tf2-ros turtlesim ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtle_tf2_cpp" = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_cpp-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "62bfdd40d37aea2c82514b94745f5053171185c5";
        hash = "sha256-Laqf0cXibpnd61TTxF4p7qrNbvptHed2DJhApKBwbEw=";
      };
    };
  });
  meta = {
    description = "\n    turtle_tf2_cpp demonstrates how to write a ROS2 C++ tf2 broadcaster and listener with the turtlesim. The turtle_tf2_listener commands turtle2 to follow turtle1 around as you drive turtle1 using the keyboard.\n  ";
  };
})
