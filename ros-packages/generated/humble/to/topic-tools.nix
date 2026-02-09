{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
  topic-tools-interfaces,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_tools";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."topic_tools";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rclpy ros2cli rosidl-runtime-py topic-tools-interfaces ];
  buildInputs = [ ament-cmake-auto ament-cmake-python rosidl-default-generators ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rclpy ros2cli rosidl-runtime-py topic-tools-interfaces ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-runtime-py std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "topic_tools" = substituteSource {
      src = fetchgit {
        name = "topic_tools-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "552a2a3a7a2f2e1f454a750b31e44ca36a52bc7c";
        hash = "sha256-Vcs/9t9O5Bg0hTmg9XnOX8N8uFifiKb0zIaqJEld7rM=";
      };
    };
  });
  meta = {
    description = "\n    Tools for directing, throttling, selecting, and otherwise messing with\n    ROS 2 topics at a meta level.\n  ";
  };
})
