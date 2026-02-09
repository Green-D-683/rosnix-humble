{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  menge-vendor,
  mkSourceSet,
  rclcpp,
  rmf-building-map-msgs,
  rmf-door-msgs,
  rmf-lift-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_building_sim_common";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rmf_building_sim_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ menge-vendor rclcpp rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ menge-vendor rclcpp rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_sim_common" = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_common-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "496355830bb176b77099167ece52f1aab1c9dcc3";
        hash = "sha256-Gq4WnPah+//zNamJOEawrwx5aWlvIY955IcYJEF43XQ=";
      };
    };
  });
  meta = {
    description = "\n    Common utility functions for Gazebo-classic and Gazebo building plugins\n  ";
  };
})
