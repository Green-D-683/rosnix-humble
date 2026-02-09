{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  point-cloud-interfaces,
  point-cloud-transport,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zlib_point_cloud_transport";
  version = "1.0.13-1";
  src = finalAttrs.passthru.sources."zlib_point_cloud_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "zlib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zlib" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zlib_point_cloud_transport" = substituteSource {
      src = fetchgit {
        name = "zlib_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "62f62855d238e4473faf4f670d5b0343e60cba63";
        hash = "sha256-arKjRma/ZQ2ZEtF+cdOM52O0i4gnqW1niMCXDY1K+Qs=";
      };
    };
  });
  meta = {
    description = "\n    zlib_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds\n    encoded with zlib\n  ";
  };
})
