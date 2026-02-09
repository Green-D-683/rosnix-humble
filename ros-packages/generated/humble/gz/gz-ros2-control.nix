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
  pname = "gz_ros2_control";
  version = "0.7.18-1";
  src = finalAttrs.passthru.sources."gz_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-gazebo6" "ignition-plugin" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-gazebo6" "ignition-plugin" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gz_ros2_control" = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "b790c881998622f49010fec0806fcaf843ba4b68";
        hash = "sha256-HaA3KyqTX9CdKKC8SfUjgTy1sDHiDx67LGpaaqlTj+8=";
      };
    };
  });
  meta = {
    description = "Gazebo ros2_control package allows to control simulated robots using ros2_control framework.";
  };
})
