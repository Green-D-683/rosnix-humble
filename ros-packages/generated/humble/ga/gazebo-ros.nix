{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-msgs,
  geometry-msgs,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  rcl,
  rclcpp,
  rclpy,
  rmw,
  ros2run,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tinyxml-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_ros";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."gazebo_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces gazebo-dev gazebo-msgs geometry-msgs launch-ros rcl rclcpp rclpy rmw sensor-msgs std-srvs tinyxml-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lxml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces gazebo-dev gazebo-msgs geometry-msgs launch-ros rcl rclcpp rclpy rmw sensor-msgs std-srvs tinyxml-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs launch-testing-ament-cmake ros2run sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_ros" = substituteSource {
      src = fetchgit {
        name = "gazebo_ros-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "1556c9cddff01b97315b092690a1a9cb765862ca";
        hash = "sha256-YnnfxjiwiXSAxOt8ZsEXADsQlJgklAwQlXRDbiwIJKw=";
      };
    };
  });
  meta = {
    description = "\n    Utilities to interface with ";
  };
})
