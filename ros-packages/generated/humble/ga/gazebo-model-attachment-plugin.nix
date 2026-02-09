{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-model-attachment-plugin-msgs,
  gazebo-msgs,
  gazebo-ros,
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
  pname = "gazebo_model_attachment_plugin";
  version = "1.0.3-2";
  src = finalAttrs.passthru.sources."gazebo_model_attachment_plugin";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ gazebo-dev gazebo-model-attachment-plugin-msgs gazebo-msgs gazebo-ros rclcpp rclpy rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ gazebo-dev gazebo-model-attachment-plugin-msgs gazebo-msgs gazebo-ros rclcpp rclpy rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ launch-testing-ament-cmake ros2launch ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_model_attachment_plugin" = substituteSource {
      src = fetchgit {
        name = "gazebo_model_attachment_plugin-source";
        url = "https://github.com/ros2-gbp/boeing_gazebo_model_attachement_plugin-release.git";
        rev = "4661d877b2fff492a3088b1ab762afcdc66bc0fc";
        hash = "sha256-5mZwCsp8e1Wuomx3TC5D2s4HV/Ha5sugOmdzy/Uc5YM=";
      };
    };
  });
  meta = {
    description = "Model Attachment Plugin";
  };
})
