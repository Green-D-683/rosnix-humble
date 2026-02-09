{
  ament-cmake,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control-demos,
  ign-ros2-control-demos,
  launch,
  launch-ros,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2launch,
  rosSystemPackages,
  rosgraph-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_ros2_control_tests";
  version = "0.7.18-1";
  src = finalAttrs.passthru.sources."gz_ros2_control_tests";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-index-python ament-lint-auto ament-lint-common controller-manager gz-ros2-control-demos ign-ros2-control-demos launch launch-ros launch-testing-ament-cmake launch-testing-ros rclpy ros2launch rosgraph-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-psutil" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_ros2_control_tests" = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control_tests-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "e004eeac64105e126b2cb771a61332f58724a345";
        hash = "sha256-1HCJQpixcHqv7TEjO0acDHFOgSmZ+Oot/NAUA1vg/4s=";
      };
    };
  });
  meta = {
    description = "Gazebo ros2 control tests";
  };
})
