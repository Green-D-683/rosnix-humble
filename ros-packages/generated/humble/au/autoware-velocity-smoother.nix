{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-planning-msgs,
  autoware-interpolation,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-osqp-interface,
  autoware-planning-msgs,
  autoware-planning-test-manager,
  autoware-qp-interface,
  autoware-utils-debug,
  autoware-utils-diagnostics,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-math,
  autoware-utils-rclcpp,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_velocity_smoother";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_velocity_smoother";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-interpolation autoware-motion-utils autoware-osqp-interface autoware-planning-msgs autoware-planning-test-manager autoware-qp-interface autoware-utils-debug autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-math autoware-utils-rclcpp autoware-vehicle-info-utils geometry-msgs nav-msgs rclcpp tf2 tf2-ros ];
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-interpolation autoware-motion-utils autoware-osqp-interface autoware-planning-msgs autoware-planning-test-manager autoware-qp-interface autoware-utils-debug autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-math autoware-utils-rclcpp autoware-vehicle-info-utils geometry-msgs nav-msgs rclcpp tf2 tf2-ros ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_velocity_smoother" = substituteSource {
      src = fetchgit {
        name = "autoware_velocity_smoother-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "a753f4ff34a4c29debb780163f54d27cfdb70907";
        hash = "sha256-kDmShHJsLP/9ihzqlnC8O0mypXCpGFAF/7cWFujkeYc=";
      };
    };
  });
  meta = {
    description = "The autoware_velocity_smoother package";
  };
})
