{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  spinnaker-camera-driver,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "spinnaker_synchronized_camera_driver";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."spinnaker_synchronized_camera_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components spinnaker-camera-driver ];
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rclcpp-components spinnaker-camera-driver ];
  checkInputs = [ ament-cmake-black ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "spinnaker_synchronized_camera_driver" = substituteSource {
      src = fetchgit {
        name = "spinnaker_synchronized_camera_driver-source";
        url = "https://github.com/ros-drivers-gbp/flir_camera_driver-release.git";
        rev = "e7d018a1a7d14215597113d77981a0ff44bbc374";
        hash = "sha256-v2ZDUUXvptnzclz6yZb3EqtqF40cmOXuRcsvmDnAjj8=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for synchronized flir cameras using the Spinnaker SDK";
  };
})
