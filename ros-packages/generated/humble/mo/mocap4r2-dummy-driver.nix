{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mocap4r2-control,
  mocap4r2-msgs,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mocap4r2_dummy_driver";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mocap4r2_dummy_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mocap4r2-control mocap4r2-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mocap4r2-control mocap4r2-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_dummy_driver" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_dummy_driver-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "c0e7cc2c85e443c4beb3cd5256392d3daf5b8b65";
        hash = "sha256-stjTDG5Pii1J7Lyro3OGXpwJFr27Ddz6+N09AgzYcZo=";
      };
    };
  });
  meta = {
    description = "\n     This is a MOCAP4ROS2 Dummy driver for testing.\n  ";
  };
})
