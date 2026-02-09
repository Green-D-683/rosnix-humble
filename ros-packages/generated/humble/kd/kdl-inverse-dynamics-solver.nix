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
  kdl-parser,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-testing,
  rosSystemPackages,
  substituteSource,
  ur-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kdl_inverse_dynamics_solver";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."kdl_inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ inverse-dynamics-solver kdl-parser pluginlib rclcpp ur-description ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liborocos-kdl" "liborocos-kdl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ inverse-dynamics-solver kdl-parser pluginlib rclcpp ur-description ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liborocos-kdl" "liborocos-kdl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "kdl_inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "kdl_inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "93926804ca3133d8c05deb218b3a0c9cbbd42218";
        hash = "sha256-jd6dG7FnZNGdsGUbRUDAchuABAgZspdzd9zYGhRQcQI=";
      };
    };
  });
  meta = {
    description = "A KDL-based library implementing an inverse dynamics solver for simulated robots.";
  };
})
