{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  sensor-msgs,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "inverse_dynamics_solver";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib rclcpp rosbag2-cpp rosbag2-storage rosbag2-storage-default-plugins sensor-msgs urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python-argparse" "python3-matplotlib" "python3-numpy" "python3-tabulate" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rclcpp rosbag2-cpp rosbag2-storage rosbag2-storage-default-plugins sensor-msgs urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python-argparse" "python3-matplotlib" "python3-numpy" "python3-tabulate" ]; };
  passthru.sources = mkSourceSet (sources: {
    "inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "fa561184cc84adf710208acedb66419ab3804c1b";
        hash = "sha256-XKLWjGt66dP0uU7o3fAhD8hXvnzsBrswy/crTPJqJGQ=";
      };
    };
  });
  meta = {
    description = "A library implementing an inverse dynamics solver for serial manipulators.";
  };
})
