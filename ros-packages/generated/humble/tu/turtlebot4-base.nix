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
  substituteSource,
  turtlebot4-msgs,
  turtlebot4-node,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_base";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_base";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs turtlebot4-msgs turtlebot4-node ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgpiod-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs turtlebot4-msgs turtlebot4-node ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgpiod-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_base" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_base-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "07ee2882210d45d19ec5685400a5c388cf20ca21";
        hash = "sha256-qt4bIeJc6lLlD2uybFeJtqH+RI5LfQ6kDfyx3o+uIpw=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Base Node";
  };
})
