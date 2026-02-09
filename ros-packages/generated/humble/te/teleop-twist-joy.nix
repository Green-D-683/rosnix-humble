{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  joy,
  launch-ros,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "teleop_twist_joy";
  version = "2.4.8-1";
  src = finalAttrs.passthru.sources."teleop_twist_joy";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs joy rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs joy rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_twist_joy" = substituteSource {
      src = fetchgit {
        name = "teleop_twist_joy-source";
        url = "https://github.com/ros2-gbp/teleop_twist_joy-release.git";
        rev = "8c35e87d8ac85608554f4d4ecaba4c9e9836412a";
        hash = "sha256-/OGIMPLrCdM5fHsC01XZdNFxpmNo2TWgxAbwYvplBUg=";
      };
    };
  });
  meta = {
    description = "Generic joystick teleop for twist robots.";
  };
})
