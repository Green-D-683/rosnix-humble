{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_limits";
  version = "2.53.1-1";
  src = finalAttrs.passthru.sources."joint_limits";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle urdf ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ rclcpp rclcpp-lifecycle urdf ];
  checkInputs = [ ament-cmake-gtest launch-ros launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "joint_limits" = substituteSource {
      src = fetchgit {
        name = "joint_limits-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "cb06bbe77744953f65d32a028a2049460edcd418";
        hash = "sha256-PbfyP8iuJ8bF+wdgaxU0LxIwMwq4q4moIY7XClHzTjU=";
      };
    };
  });
  meta = {
    description = "Interfaces for handling of joint limits for controllers or hardware.";
  };
})
