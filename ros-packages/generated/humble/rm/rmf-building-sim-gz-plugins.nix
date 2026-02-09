{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  menge-vendor,
  mkSourceSet,
  rclcpp,
  rmf-building-sim-common,
  rmf-fleet-msgs,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_building_sim_gz_plugins";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rmf_building_sim_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ menge-vendor rclcpp rmf-building-sim-common rmf-fleet-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-fortress" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ menge-vendor rclcpp rmf-building-sim-common rmf-fleet-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-fortress" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "a3567ffe3630a1f367990359c8d0ff54be6b3383";
        hash = "sha256-VPvRQtiwx40ufdzEL/GL2pzzDfXy/qcJFJJPCSze0To=";
      };
    };
  });
  meta = {
    description = "\n    Gazebo plugins for building infrastructure simulation\n  ";
  };
})
