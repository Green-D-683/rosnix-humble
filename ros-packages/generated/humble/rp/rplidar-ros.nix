{
  ament-cmake-auto,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rplidar_ros";
  version = "2.1.4-1";
  src = finalAttrs.passthru.sources."rplidar_ros";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake-auto ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "rplidar_ros" = substituteSource {
      src = fetchgit {
        name = "rplidar_ros-source";
        url = "https://github.com/ros2-gbp/rplidar_ros-release.git";
        rev = "a143a58fe1d9d193dd58dc64b24403aa6cc6d6f2";
        hash = "sha256-dcLVgW6m/bK+BIzVO44Tn6zPaq5W18bw3U11JGZqrCU=";
      };
    };
  });
  meta = {
    description = "\n    The rplidar ros package, support rplidar A1/A2/A3/S1/S2/S3/T1\n  ";
  };
})
