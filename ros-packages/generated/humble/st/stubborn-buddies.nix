{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rcutils,
  rosSystemPackages,
  std-msgs,
  stubborn-buddies-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "stubborn_buddies";
  version = "1.0.0-5";
  src = finalAttrs.passthru.sources."stubborn_buddies";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rclcpp-lifecycle rcutils std-msgs stubborn-buddies-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rclcpp-lifecycle rcutils std-msgs stubborn-buddies-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "stubborn_buddies" = substituteSource {
      src = fetchgit {
        name = "stubborn_buddies-source";
        url = "https://github.com/ros2-gbp/stubborn_buddies-release.git";
        rev = "3a57d99c24c5c430c9c76a32585eb7817f1fab25";
        hash = "sha256-gR08XIszXNwbw343ie74jForyMoXvqCbhynmzAN+Y/w=";
      };
    };
  });
  meta = {
    description = "Demo that uses node composition of lifecycle nodes to achieve fail-over robustness on ROS nodes";
  };
})
