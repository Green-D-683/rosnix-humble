{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-localization-util,
  autoware-utils-diagnostics,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-tf,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_gyro_odometer";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_gyro_odometer";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-localization-util autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-tf diagnostic-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-localization-util autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-tf diagnostic-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_gyro_odometer" = substituteSource {
      src = fetchgit {
        name = "autoware_gyro_odometer-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "9bb84c68aed3717902be35c1c3b081c53e5d012a";
        hash = "sha256-FCwSPCKt0wMij2rEO5j5769HMn23g8h0M05KF0rl9D0=";
      };
    };
  });
  meta = {
    description = "The autoware_gyro_odometer package as a ROS 2 node";
  };
})
