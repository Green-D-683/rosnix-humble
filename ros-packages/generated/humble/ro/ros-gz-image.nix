{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  ros-gz-bridge,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_image";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_gz_image";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ image-transport rclcpp ros-gz-bridge sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-msgs8" "ignition-transport11" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ image-transport rclcpp ros-gz-bridge sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-msgs8" "ignition-transport11" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_image" = substituteSource {
      src = fetchgit {
        name = "ros_gz_image-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "e130a442e0139495ac87aa274f5de2f9767cf89f";
        hash = "sha256-d7DI0G81+EznEopRSmIIve8bkKmL13RxZ+KNDtHM1+k=";
      };
    };
  });
  meta = {
    description = "Image utilities for Gazebo simulation with ROS.";
  };
})
