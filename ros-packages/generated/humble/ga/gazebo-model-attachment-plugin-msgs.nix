{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclpy,
  ros2launch,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_model_attachment_plugin_msgs";
  version = "1.0.3-2";
  src = finalAttrs.passthru.sources."gazebo_model_attachment_plugin_msgs";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-cppcheck ament-cmake-cpplint rclcpp rclpy rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-cppcheck ament-cmake-cpplint rclcpp rclpy rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cpplint launch-testing-ament-cmake ros2launch ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_model_attachment_plugin_msgs" = substituteSource {
      src = fetchgit {
        name = "gazebo_model_attachment_plugin_msgs-source";
        url = "https://github.com/ros2-gbp/boeing_gazebo_model_attachement_plugin-release.git";
        rev = "d6fc5995054bc293323829f89d049f788d3a64ef";
        hash = "sha256-DN4Mo35s0go4wXgqV2Nk99oA27Cjlxw+eVMmWOqcoOE=";
      };
    };
  });
  meta = {
    description = "Model Attachment Plugin";
  };
})
