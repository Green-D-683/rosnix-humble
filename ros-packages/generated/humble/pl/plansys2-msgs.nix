{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_msgs";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rclcpp rosidl-default-generators std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_msgs" = substituteSource {
      src = fetchgit {
        name = "plansys2_msgs-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "80bc1aac9b81db21dd8ff1f7ed0c0dba51f84fc8";
        hash = "sha256-hknUk8JuraiESL3Xgo8iGU7fJnIp64LcXoAhwW2e1IY=";
      };
    };
  });
  meta = {
    description = "Messages and service files for the ROS2 Planning System";
  };
})
