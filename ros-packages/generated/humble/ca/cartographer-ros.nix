{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  cartographer,
  cartographer-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  rclcpp,
  robot-state-publisher,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-msgs,
  tf2-ros,
  urdf,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cartographer_ros";
  version = "2.0.9002-1";
  src = finalAttrs.passthru.sources."cartographer_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces cartographer cartographer-ros-msgs geometry-msgs launch nav-msgs pcl-conversions rclcpp robot-state-publisher rosbag2-cpp rosbag2-storage sensor-msgs std-msgs tf2 tf2-eigen tf2-msgs tf2-ros urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "google-mock" "libabsl-dev" "libgflags-dev" "libgoogle-glog-dev" "libpcl-all-dev" "python3-sphinx" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces cartographer cartographer-ros-msgs geometry-msgs launch nav-msgs pcl-conversions rclcpp robot-state-publisher rosbag2-cpp rosbag2-storage sensor-msgs std-msgs tf2 tf2-eigen tf2-msgs tf2-ros urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "google-mock" "libabsl-dev" "libgflags-dev" "libgoogle-glog-dev" "libpcl-all-dev" "python3-sphinx" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cartographer_ros" = substituteSource {
      src = fetchgit {
        name = "cartographer_ros-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "fadcc22fe1c699bbdbfca5bc9939e6a1b5355bda";
        hash = "sha256-jwffouf6DWEDef3EsBaUOspjnd85bGZCl1M6EAl1Xew=";
      };
    };
  });
  meta = {
    description = "\n    Cartographer is a system that provides real-time simultaneous localization\n    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor\n    configurations. This package provides Cartographer's ROS integration.\n  ";
  };
})
