{
  ament-cmake-auto,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-pal,
  mkSourceSet,
  rclcpp-components,
  rclpy,
  ros2launch,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_rgbd_sensors";
  version = "4.18.2-1";
  src = finalAttrs.passthru.sources."pmb2_rgbd_sensors";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-updater launch-pal rclcpp-components rclpy ros2launch ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-updater launch-pal rclcpp-components rclpy ros2launch ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_rgbd_sensors" = substituteSource {
      src = fetchgit {
        name = "pmb2_rgbd_sensors-source";
        url = "https://github.com/pal-gbp/pmb2_navigation-gbp.git";
        rev = "62262bfd7107ec7f3255f76f1b5babafc08c12fc";
        hash = "sha256-ihLqCkqrP9M6i/NKIBWKirmM52VUL4wDDVIBViI0iGM=";
      };
    };
  });
  meta = {
    description = "pmb2-specific RGBD sensors module and params files.";
  };
})
