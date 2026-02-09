{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  depthimage-to-laserscan,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  pointcloud-to-laserscan,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_map_server";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_map_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ as2-core as2-msgs depthimage-to-laserscan geometry-msgs nav-msgs pluginlib pointcloud-to-laserscan rclcpp sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-core as2-msgs depthimage-to-laserscan geometry-msgs nav-msgs pluginlib pointcloud-to-laserscan rclcpp sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_map_server" = substituteSource {
      src = fetchgit {
        name = "as2_map_server-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "77059b198d3081f1099c2f5f1583e460ef4ffd19";
        hash = "sha256-DB7j8MjOamOx3+T5tqWiSEofGmuwI8cmwHnJWTpYQZU=";
      };
    };
  });
  meta = {
    description = "Aerostack2 map server node for mapping the environment";
  };
})
