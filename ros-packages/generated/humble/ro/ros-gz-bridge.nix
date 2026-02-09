{
  actuator-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gps-msgs,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  ros-gz-interfaces,
  rosSystemPackages,
  rosgraph-msgs,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-msgs,
  trajectory-msgs,
  vision-msgs,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_bridge";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_gz_bridge";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ actuator-msgs geometry-msgs gps-msgs nav-msgs rclcpp rclcpp-components ros-gz-interfaces rosgraph-msgs sensor-msgs std-msgs tf2-msgs trajectory-msgs vision-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-msgs8" "ignition-transport11" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ actuator-msgs geometry-msgs gps-msgs nav-msgs rclcpp rclcpp-components ros-gz-interfaces rosgraph-msgs sensor-msgs std-msgs tf2-msgs trajectory-msgs vision-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-msgs8" "ignition-transport11" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_bridge" = substituteSource {
      src = fetchgit {
        name = "ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "ba341aec332c81efcd656b29cf7a859925ef9325";
        hash = "sha256-g4qk3A5T/mFEdsN5kLNxVNxH4ShrNl8lmtdESzKKUrk=";
      };
    };
  });
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
})
