{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-msgs,
  mrpt-sensorlib,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_generic_sensor";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."mrpt_generic_sensor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common mrpt-msgs mrpt-sensorlib rclcpp rclcpp-components ros-environment sensor-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-lint-auto ament-lint-common mrpt-msgs mrpt-sensorlib rclcpp rclcpp-components ros-environment sensor-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_generic_sensor" = substituteSource {
      src = fetchgit {
        name = "mrpt_generic_sensor-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "fa527661447aaab37c1214be4f4bbf4cf99ed678";
        hash = "sha256-ErIbVUMZwkEMrHoMfbeUgw2uH49GuUXgdP7Vwt1iREE=";
      };
    };
  });
  meta = {
    description = "ROS node for interfacing any sensor supported by mrpt-hwdrivers";
  };
})
