{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gmock,
  ament-lint-auto,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-lint-common,
  autoware-map-height-fitter,
  autoware-motion-utils,
  autoware-utils-diagnostics,
  autoware-utils-logging,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_pose_initializer";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_pose_initializer";
  nativeBuildInputs = [ ament-cmake autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-v1-msgs autoware-component-interface-specs autoware-map-height-fitter autoware-motion-utils autoware-utils-diagnostics autoware-utils-logging geometry-msgs rclcpp rclcpp-components std-srvs ];
  buildInputs = [ ament-cmake autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-v1-msgs autoware-component-interface-specs autoware-map-height-fitter autoware-motion-utils autoware-utils-diagnostics autoware-utils-logging geometry-msgs rclcpp rclcpp-components std-srvs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gmock ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_pose_initializer" = substituteSource {
      src = fetchgit {
        name = "autoware_pose_initializer-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "4a4e9740a76c94a1e6437835ac36b6a3127351c0";
        hash = "sha256-UdWuilBranRQteo4WG28YgbSiKtc7xAIesfFZmtGXHM=";
      };
    };
  });
  meta = {
    description = "The autoware_pose_initializer package";
  };
})
