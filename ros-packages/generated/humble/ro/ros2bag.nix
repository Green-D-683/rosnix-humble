{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosbag2-py,
  rosbag2-storage-default-plugins,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2bag";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."ros2bag";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli rosbag2-py rosbag2-storage-default-plugins ];
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli rosbag2-py rosbag2-storage-default-plugins ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-testing launch-testing-ros rosbag2-storage-default-plugins ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2bag" = substituteSource {
      src = fetchgit {
        name = "ros2bag-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "4ba9bef11f60f1e6387d62d911ee6d953ce0d05b";
        hash = "sha256-iH5aimi9n9kv9LS3IqvDvMXZ+ZKenShzTlS99NF+ktg=";
      };
    };
  });
  meta = {
    description = "\n    Entry point for rosbag in ROS 2\n  ";
  };
})
