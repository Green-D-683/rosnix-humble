{
  ament-cmake,
  ament-cmake-cpplint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_processors";
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."imu_processors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs tf2-ros ];
  checkInputs = [ ament-cmake-cpplint ];
  passthru.sources = mkSourceSet (sources: {
    "imu_processors" = substituteSource {
      src = fetchgit {
        name = "imu_processors-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "e15ad4a314144bddf68dc4142b9ff3ca4c964547";
        hash = "sha256-7hZIdvNGKgABU4l3MJMBcVsTWfj/ER23SmC2sJH1ork=";
      };
    };
  });
  meta = {
    description = "Processors for sensor_msgs::Imu data";
  };
})
