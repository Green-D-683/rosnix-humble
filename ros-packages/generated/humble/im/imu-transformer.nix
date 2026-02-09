{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_transformer";
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."imu_transformer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ message-filters rclcpp rclcpp-components sensor-msgs tf2-ros tf2-sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters rclcpp rclcpp-components sensor-msgs tf2-ros tf2-sensor-msgs ];
  checkInputs = [ geometry-msgs tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "imu_transformer" = substituteSource {
      src = fetchgit {
        name = "imu_transformer-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "62f2924d56ec9c4e21459073705a1f23e7711118";
        hash = "sha256-Plc1rKMYGndrBouRWUfznacsiOj7HXIpMkeOhQhYFjk=";
      };
    };
  });
  meta = {
    description = "Node/components to transform sensor_msgs::Imu data from one frame into another.";
  };
})
