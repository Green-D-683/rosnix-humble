{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rmf-building-map-msgs,
  rmf-fleet-msgs,
  rmf-robot-sim-common,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_robot_sim_gz_plugins";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "ignition-fortress" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "ignition-fortress" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_robot_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "e64818e3838ac83105242014c2b30261b7479d88";
        hash = "sha256-fPDS+NkAAagn6Vy+PkYPIEEqQR4eP47hPgH80QJyvGA=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 Gazebo plugins for TeleportIngestors and TeleportDispensers\n  ";
  };
})
