{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-hardware,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_ign_ros2_control";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_ign_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp controller-manager franka-hardware hardware-interface pluginlib rclcpp rclcpp-lifecycle yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-gazebo6" "ignition-plugin" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp controller-manager franka-hardware hardware-interface pluginlib rclcpp rclcpp-lifecycle yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-gazebo6" "ignition-plugin" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "franka_ign_ros2_control" = substituteSource {
      src = fetchgit {
        name = "franka_ign_ros2_control-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "b5cc7bab902d0b9194632077a4470a01ac891ba0";
        hash = "sha256-wQCG1CXfsEPgiFCI6sKdluu6up2SHJboRI7EA8vUzSY=";
      };
    };
  });
  meta = {
    description = "Ignition ros2_control package allows to control simulated robots using ros2_control framework. ";
  };
})
