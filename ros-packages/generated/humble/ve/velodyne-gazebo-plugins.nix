{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-msgs,
  gazebo-ros,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_gazebo_plugins";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."velodyne_gazebo_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-dev gazebo-msgs gazebo-ros rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-dev gazebo-msgs gazebo-ros rclcpp sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne_gazebo_plugins" = substituteSource {
      src = fetchgit {
        name = "velodyne_gazebo_plugins-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "9bd6c3eb7da9490d80492e378b195389ed61fd91";
        hash = "sha256-TFxh7d/7+m5z05amlR634rbaqZYAHs06SxUx3ZlM/NI=";
      };
    };
  });
  meta = {
    description = "\n    Gazebo plugin to provide simulated data from Velodyne laser scanners.\n  ";
  };
})
