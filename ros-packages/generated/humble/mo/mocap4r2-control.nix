{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mocap4r2-control-msgs,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mocap4r2_control";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mocap4r2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mocap4r2-control-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mocap4r2-control-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_control" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_control-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "5705205c336a3155e98561916d3080ae73b6ee22";
        hash = "sha256-dItHIh3IGoVKn/xcPQppnUZHBrq2F8k1i3si9+0o8ys=";
      };
    };
  });
  meta = {
    description = "Control protocol for MOCAP4ROS2 Project";
  };
})
