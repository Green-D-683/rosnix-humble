{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-adapi-specs,
  autoware-adapi-v1-msgs,
  autoware-adapi-version-msgs,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-geography-utils,
  autoware-global-parameter-loader,
  autoware-lint-common,
  autoware-localization-msgs,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-system-msgs,
  autoware-utils-rclcpp,
  autoware-vehicle-info-utils,
  autoware-vehicle-msgs,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  shape-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_default_adapi";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_default_adapi";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-specs autoware-adapi-v1-msgs autoware-adapi-version-msgs autoware-component-interface-specs autoware-geography-utils autoware-global-parameter-loader autoware-localization-msgs autoware-motion-utils autoware-planning-msgs autoware-system-msgs autoware-utils-rclcpp autoware-vehicle-info-utils autoware-vehicle-msgs diagnostic-updater geographic-msgs nav-msgs rclcpp rclcpp-components shape-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-flask" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-specs autoware-adapi-v1-msgs autoware-adapi-version-msgs autoware-component-interface-specs autoware-geography-utils autoware-global-parameter-loader autoware-localization-msgs autoware-motion-utils autoware-planning-msgs autoware-system-msgs autoware-utils-rclcpp autoware-vehicle-info-utils autoware-vehicle-msgs diagnostic-updater geographic-msgs nav-msgs rclcpp rclcpp-components shape-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flask" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_default_adapi" = substituteSource {
      src = fetchgit {
        name = "autoware_default_adapi-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "38614c7d336a2444e7eac805680f4418049b4030";
        hash = "sha256-2kdfILrn0JpaQA1jUaggnbudOOepkAs0RNTd8euhlLs=";
      };
    };
  });
  meta = {
    description = "The autoware_default_adapi package";
  };
})
