{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-adapi-specs,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-lint-common,
  autoware-map-height-fitter,
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
  pname = "autoware_adapi_adaptors";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_adapi_adaptors";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-specs autoware-adapi-v1-msgs autoware-component-interface-specs autoware-map-height-fitter rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-specs autoware-adapi-v1-msgs autoware-component-interface-specs autoware-map-height-fitter rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_adaptors" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_adaptors-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "f6f15036518eec760ce5c66291cccfa0de3e12cb";
        hash = "sha256-IXH1WMNsn9CLQ7hPsRYELddJIHB+qm4Ql9nnMP9AY9M=";
      };
    };
  });
  meta = {
    description = "The adapi_adaptors package";
  };
})
