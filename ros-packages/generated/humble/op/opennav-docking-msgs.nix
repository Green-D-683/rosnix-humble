{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking_msgs";
  version = "0.0.2-4";
  src = finalAttrs.passthru.sources."opennav_docking_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action rclcpp-lifecycle rosidl-default-generators tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action rclcpp-lifecycle rosidl-default-generators tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking_msgs" = substituteSource {
      src = fetchgit {
        name = "opennav_docking_msgs-source";
        url = "https://github.com/open-navigation/opennav_docking-release.git";
        rev = "14570860bbb1788d2e282429324877b666045f13";
        hash = "sha256-WbENEsNXm9/lcCKkhSdI7Y/1ciQdXY8UepMm2KKpgL0=";
      };
    };
  });
  meta = {
    description = "A set of ROS interfaces for docking and undocking";
  };
})
