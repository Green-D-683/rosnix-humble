{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_publisher";
  version = "0.15.5-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "b66a0d38d0542c9f1b2813cd97098c6be785ec28";
        hash = "sha256-MOa+zNtitx7tU0Or/vi5AI4XKn5z/3mliVkMGrJA5jk=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publisher nodes";
  };
})
