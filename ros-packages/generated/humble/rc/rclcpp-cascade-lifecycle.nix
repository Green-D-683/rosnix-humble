{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cascade-lifecycle-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp_cascade_lifecycle";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."rclcpp_cascade_lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_cascade_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclcpp_cascade_lifecycle-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "e72ca05c0e8c334d973d2cb1cde2e2dd9291f406";
        hash = "sha256-jnLMV11NT92uzCMWAEcBgLUG4kfv4dpyViPfqZU0NWI=";
      };
    };
  });
  meta = {
    description = "Provides a mechanism to make trees of lifecycle nodes to propagate state changes";
  };
})
