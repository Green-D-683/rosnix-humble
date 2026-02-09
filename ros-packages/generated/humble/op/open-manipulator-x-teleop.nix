{
  ament-cmake,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  open-manipulator-x-bringup,
  open-manipulator-x-description,
  open-manipulator-x-moveit-config,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_x_teleop";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."open_manipulator_x_teleop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ control-msgs geometry-msgs nav-msgs open-manipulator-x-bringup open-manipulator-x-description open-manipulator-x-moveit-config rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs geometry-msgs nav-msgs open-manipulator-x-bringup open-manipulator-x-description open-manipulator-x-moveit-config rclcpp sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_x_teleop" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_x_teleop-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "81614c64949d97cd0201e0102aca38b2cc94d8a0";
        hash = "sha256-todyDqv86YkesRg26VXh985M2a7bKKp3tbEvMYE0TTY=";
      };
    };
  });
  meta = {
    description = "\n    OpenMANIPULATOR-X teleop ROS 2 package.\n  ";
  };
})
