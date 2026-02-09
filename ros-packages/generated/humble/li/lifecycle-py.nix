{
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "lifecycle_py";
  version = "0.20.8-1";
  src = finalAttrs.passthru.sources."lifecycle_py";
  propagatedNativeBuildInputs = [ lifecycle-msgs rclpy std-msgs ];
  propagatedBuildInputs = [ lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common lifecycle ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_py" = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9ae97b36fdd6dbd7385a471d7dabff5c7575750f";
        hash = "sha256-lCqxjWcEidA95EPL1qEfHof89aQ4MFfFP4rvYKMB7go=";
      };
    };
  });
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
})
