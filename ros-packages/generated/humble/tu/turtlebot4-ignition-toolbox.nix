{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rcutils,
  ros-ign-interfaces,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  turtlebot4-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_ignition_toolbox";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_ignition_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-action rcutils ros-ign-interfaces sensor-msgs std-msgs turtlebot4-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-action rcutils ros-ign-interfaces sensor-msgs std-msgs turtlebot4-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_ignition_toolbox" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_ignition_toolbox-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "f3d31aa8a3557477fe613f1f1fa0b5b7b0fad2fb";
        hash = "sha256-aQRPkgl0xIMwpxp+OrCX7sG2+RwJ+OYRhgazSGVe3f8=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Ignition Toolbox";
  };
})
