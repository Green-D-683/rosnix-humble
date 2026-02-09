{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osqp-vendor,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_osqp_interface";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_osqp_interface";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ osqp-vendor rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ osqp-vendor rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "autoware_osqp_interface" = substituteSource {
      src = fetchgit {
        name = "autoware_osqp_interface-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "c755ac62b606a0d23d60a4512bfaf80259552ff8";
        hash = "sha256-kBaLwbsJY04yQU9yFxwkuVl4Xe1P9Yuxp3dOiINcb2M=";
      };
    };
  });
  meta = {
    description = "Interface for the OSQP solver";
  };
})
