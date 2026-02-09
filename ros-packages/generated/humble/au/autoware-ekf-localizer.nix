{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-kalman-filter,
  autoware-lint-common,
  autoware-localization-util,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-system,
  buildAmentCmakePackage,
  diagnostic-msgs,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  ros-testing,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_ekf_localizer";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_ekf_localizer";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-kalman-filter autoware-localization-util autoware-utils-geometry autoware-utils-logging autoware-utils-system diagnostic-msgs geometry-msgs nav-msgs rclcpp rclcpp-components std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-kalman-filter autoware-localization-util autoware-utils-geometry autoware-utils-logging autoware-utils-system diagnostic-msgs geometry-msgs nav-msgs rclcpp rclcpp-components std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_ekf_localizer" = substituteSource {
      src = fetchgit {
        name = "autoware_ekf_localizer-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "5b552e482f7da7878074d7ac52ff4b37bb9f307c";
        hash = "sha256-QMYjj80DZe+lusdMPL9hHWRZZv/fRjYzo44tO785gsc=";
      };
    };
  });
  meta = {
    description = "The autoware_ekf_localizer package";
  };
})
