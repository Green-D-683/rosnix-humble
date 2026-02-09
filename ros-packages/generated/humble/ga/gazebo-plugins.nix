{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-info-manager,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-msgs,
  gazebo-ros,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_plugins";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."gazebo_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-info-manager cv-bridge gazebo-dev gazebo-msgs gazebo-ros geometry-msgs image-transport nav-msgs rclcpp sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-ros trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge gazebo-dev gazebo-msgs gazebo-ros geometry-msgs image-transport nav-msgs rclcpp sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-ros trajectory-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common cv-bridge ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_plugins" = substituteSource {
      src = fetchgit {
        name = "gazebo_plugins-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "79bc1dc4cc90e0edba2251d8f9dd1d6089281e97";
        hash = "sha256-9DnE/55oAoPVtBZwTiP+cDGBat7cbqsT8gj11qI2yTI=";
      };
    };
  });
  meta = {
    description = "\n    Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components.\n  ";
  };
})
