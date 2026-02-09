{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  backward-ros,
  buildAmentCmakePackage,
  fast-gicp,
  fetchgit,
  fetchurl,
  fetchzip,
  geodesy,
  geographic-msgs,
  geometry-msgs,
  libg2o,
  message-filters,
  mkSourceSet,
  nav-msgs,
  ndt-omp,
  nmea-msgs,
  pcl-ros,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rviz-visual-tools,
  sensor-msgs,
  situational-graphs-msgs,
  situational-graphs-reasoning,
  situational-graphs-reasoning-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-ros,
  tf2-sensor-msgs,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lidar_situational_graphs";
  version = "0.0.1-2";
  src = finalAttrs.passthru.sources."lidar_situational_graphs";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-gtest backward-ros fast-gicp geodesy geographic-msgs geometry-msgs libg2o message-filters nav-msgs ndt-omp nmea-msgs pcl-ros rclcpp rclpy rviz-visual-tools sensor-msgs situational-graphs-msgs situational-graphs-reasoning situational-graphs-reasoning-msgs tf2 tf2-eigen tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libceres-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-gtest backward-ros fast-gicp geodesy geographic-msgs geometry-msgs libg2o message-filters nav-msgs ndt-omp nmea-msgs pcl-ros rclcpp rclpy rviz-visual-tools sensor-msgs situational-graphs-msgs situational-graphs-reasoning situational-graphs-reasoning-msgs tf2 tf2-eigen tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "lidar_situational_graphs" = substituteSource {
      src = fetchgit {
        name = "lidar_situational_graphs-source";
        url = "https://github.com/ros2-gbp/lidar_situational_graphs-release.git";
        rev = "d8f00159932a58183b450001b9dcde2413c8b026";
        hash = "sha256-Aub/JED7qeD6syo4xIlL0+hVUUXotVR8HeBoy+WOlkg=";
      };
    };
  });
  meta = {
    description = "The lidar situational graphs package for generating 3D optimizable scene graphs";
  };
})
