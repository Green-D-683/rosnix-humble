{
  ament-cmake,
  buildAmentCmakePackage,
  dynamixel-sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_hardware";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_hardware";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dynamixel-sdk hardware-interface pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-sdk hardware-interface pluginlib rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_hardware" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_hardware-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "3ed81dac940918567f2e54fe9bb44453c03df0b2";
        hash = "sha256-v+QZAgMUIwR9ouAOwheVzLMobHZHmFkJzyHfBO6FMmg=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 package for turtlebot3_manipulation_hardware\n  ";
  };
})
