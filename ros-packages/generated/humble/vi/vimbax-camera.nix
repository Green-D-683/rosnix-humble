{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-info-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  launch-pytest,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  vimbax-camera-events,
  vimbax-camera-msgs,
  vmbc-interface,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vimbax_camera";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."vimbax_camera";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-info-manager image-transport rclcpp rclcpp-components vimbax-camera-events vimbax-camera-msgs vmbc-interface ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-info-manager image-transport rclcpp rclcpp-components vimbax-camera-events vimbax-camera-msgs vmbc-interface ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "vimbax_camera" = substituteSource {
      src = fetchgit {
        name = "vimbax_camera-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "5ce74b5ef803cb7b5177f4ef3d0897b7c8615335";
        hash = "sha256-/RxOmnarS/N/KJnsiiDP7aFUPvTqgGpZNa8J8HO6EWY=";
      };
    };
  });
  meta = {
    description = "ROS 2 node package for Vimba X cameras";
  };
})
