{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rmf-building-map-msgs,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization_floorplans";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization_floorplans";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_floorplans" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_floorplans-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "1050f0023451801866232eb64f87f2052b2de4db";
        hash = "sha256-D3g1WsC4rqCmAYkV+zRjiZQhh/O75zixJ++DaYXyADg=";
      };
    };
  });
  meta = {
    description = "A package to visualize the floorplans for levels in a building";
  };
})
