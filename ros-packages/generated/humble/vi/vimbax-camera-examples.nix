{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  launch-pytest,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  substituteSource,
  vimbax-camera-events,
  vimbax-camera-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vimbax_camera_examples";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."vimbax_camera_examples";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport rclcpp rclcpp-components rclpy vimbax-camera-events vimbax-camera-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ cv-bridge image-transport rclcpp rclcpp-components rclpy vimbax-camera-events vimbax-camera-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "vimbax_camera_examples" = substituteSource {
      src = fetchgit {
        name = "vimbax_camera_examples-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "df322254a7170e4456516f27f9e71139a1176a4e";
        hash = "sha256-LeVUkKuZvysWJ0XC+0zu5Dw+2+d9kVOelsVZkp6BsxU=";
      };
    };
  });
  meta = {
    description = "VimbaX camera examples";
  };
})
