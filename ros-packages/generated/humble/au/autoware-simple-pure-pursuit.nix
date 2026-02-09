{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-control-msgs,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-test-utils,
  autoware-utils-rclcpp,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_simple_pure_pursuit";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_simple_pure_pursuit";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-control-msgs autoware-motion-utils autoware-planning-msgs autoware-test-utils autoware-utils-rclcpp autoware-vehicle-info-utils rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-control-msgs autoware-motion-utils autoware-planning-msgs autoware-test-utils autoware-utils-rclcpp autoware-vehicle-info-utils rclcpp rclcpp-components ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_simple_pure_pursuit" = substituteSource {
      src = fetchgit {
        name = "autoware_simple_pure_pursuit-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "0493774a00053a3a7a8ffce473228b45e18adb0d";
        hash = "sha256-Ck/pM6YJluPl+xYGil/0mWdBmkCRDc1LQSKswWeqjxw=";
      };
    };
  });
  meta = {
    description = "The autoware_simple_pure_pursuit package";
  };
})
