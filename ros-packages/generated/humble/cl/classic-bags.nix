{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-py,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-storage-mcap,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "classic_bags";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."classic_bags";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ builtin-interfaces rclcpp rclpy rosbag2-cpp rosbag2-py rosbag2-storage rosidl-runtime-py ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces rclcpp rclpy rosbag2-cpp rosbag2-py rosbag2-storage rosidl-runtime-py ];
  checkInputs = [ ament-cmake-pytest rosbag2-storage-default-plugins rosbag2-storage-mcap std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "classic_bags" = substituteSource {
      src = fetchgit {
        name = "classic_bags-source";
        url = "https://github.com/ros2-gbp/classic_bags-release.git";
        rev = "0ff3fa8fd0b096b1a2ed05ef82c5e8655d25b11d";
        hash = "sha256-jnjTtGuonkplDsr0ZGoCe1uc4vhSAJsAGta+5KClLpY=";
      };
    };
  });
  meta = {
    description = "A ROS 2 interface in the style of ROS 1 for reading and writing bag files";
  };
})
