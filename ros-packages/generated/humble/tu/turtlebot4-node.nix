{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  turtlebot4-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_node";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot4_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs std-srvs turtlebot4-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs std-srvs turtlebot4-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_node" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_node-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "470c0f58af7c422531c3034502d615dfc13a8834";
        hash = "sha256-NnKM9dm8lkzkuR4iWKL3pVwphDaN59C/HmnpZ3PK0GQ=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Node";
  };
})
