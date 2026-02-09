{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-simple-controller-manager,
  pluginlib,
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_control_interface";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_ros_control_interface";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager-msgs moveit-common moveit-core moveit-simple-controller-manager pluginlib rclcpp-action trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager-msgs moveit-common moveit-core moveit-simple-controller-manager pluginlib rclcpp-action trajectory-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_control_interface" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_control_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "bf9b7415a06f51f6d9a3f7a5f1aec6b42b9af165";
        hash = "sha256-AGL4BNg+xrYS5C0CnuGUA87AgRdDig7XKztKj54phJs=";
      };
    };
  });
  meta = {
    description = "ros_control controller manager interface for MoveIt";
  };
})
