{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-interpolation,
  autoware-lint-common,
  autoware-planning-msgs,
  autoware-utils-geometry,
  autoware-utils-math,
  autoware-utils-system,
  autoware-utils-visualization,
  autoware-vehicle-msgs,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_motion_utils";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_motion_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-v1-msgs autoware-internal-planning-msgs autoware-interpolation autoware-planning-msgs autoware-utils-geometry autoware-utils-math autoware-utils-system autoware-utils-visualization autoware-vehicle-msgs builtin-interfaces geometry-msgs rclcpp tf2 tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-v1-msgs autoware-internal-planning-msgs autoware-interpolation autoware-planning-msgs autoware-utils-geometry autoware-utils-math autoware-utils-system autoware-utils-visualization autoware-vehicle-msgs builtin-interfaces geometry-msgs rclcpp tf2 tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_motion_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_motion_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "8f01d06e523128f15b5ad7d96e55391d1c6b0475";
        hash = "sha256-wYf3dlDxBrabbRmF5EUI4nW0FvW2jeJKw7+vYxkHtwE=";
      };
    };
  });
  meta = {
    description = "The autoware_motion_utils package";
  };
})
