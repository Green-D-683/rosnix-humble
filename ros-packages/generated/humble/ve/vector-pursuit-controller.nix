{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-controller,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vector_pursuit_controller";
  version = "1.0.2-2";
  src = finalAttrs.passthru.sources."vector_pursuit_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common nav2-controller nav2-core nav2-costmap-2d nav2-util nav-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "vector_pursuit_controller" = substituteSource {
      src = fetchgit {
        name = "vector_pursuit_controller-source";
        url = "https://github.com/ros2-gbp/vector_pursuit_controller-release.git";
        rev = "7dfdb06eddf6b22636dab812b0e5c3c877238452";
        hash = "sha256-O5Cp5NIzPgArO991qac486EIXJD37swsEidkg1IhGbQ=";
      };
    };
  });
  meta = {
    description = "Vector Pursuit Controller";
  };
})
