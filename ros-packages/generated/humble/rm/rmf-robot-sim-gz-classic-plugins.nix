{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-ros,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rmf-building-map-msgs,
  rmf-fleet-msgs,
  rmf-robot-sim-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_robot_sim_gz_classic_plugins";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_gz_classic_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-dev gazebo-ros geometry-msgs rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-dev gazebo-ros geometry-msgs rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_robot_sim_gz_classic_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_classic_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "19b7c05afa820414df40243e5b8cead405b78289";
        hash = "sha256-Dua6LF6jMjkqzXcKxt/RDy77YbdgN3KmG+5pzTeR48Q=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 Gazebo-classic plugins for TeleportIngestors, TeleportDispensers and Readonly Objects\n  ";
  };
})
