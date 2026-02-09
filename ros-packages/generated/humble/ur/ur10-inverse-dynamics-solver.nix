{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  inverse-dynamics-solver,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-testing,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  substituteSource,
  trajectory-msgs,
  ur-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur10_inverse_dynamics_solver";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."ur10_inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ inverse-dynamics-solver pluginlib ur-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ inverse-dynamics-solver pluginlib ur-description ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp ros-testing rosbag2-cpp rosbag2-storage rosbag2-storage-default-plugins trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ur10_inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "ur10_inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "0f9ad1f9eb7d97627ee9b29a7d45e1c39e58a52f";
        hash = "sha256-pFCAh9RWiT1kQu1/YQcFlZcMdcZuDI7YdAZ/EGujm5M=";
      };
    };
  });
  meta = {
    description = "A C++ library implementing the inverse dynamics solver for the UR10 real robot.";
  };
})
