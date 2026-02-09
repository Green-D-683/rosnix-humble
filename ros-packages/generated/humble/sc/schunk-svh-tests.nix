{
  buildCatkinPackage,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  rosSystemPackages,
  schunk-svh-driver,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "schunk_svh_tests";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."schunk_svh_tests";
  checkInputs = [ controller-manager-msgs launch launch-ros launch-testing-ament-cmake schunk-svh-driver ];
  passthru.sources = mkSourceSet (sources: {
    "schunk_svh_tests" = substituteSource {
      src = fetchgit {
        name = "schunk_svh_tests-source";
        url = "https://github.com/ros2-gbp/schunk_svh_ros_driver-release.git";
        rev = "28817e554b0c1280747b17c0d41037375cafcbe9";
        hash = "sha256-IT71FwEE4bMQ9QaC3uUSw09EhVClUM+lFg/6qbRXvtQ=";
      };
    };
  });
  meta = {
    description = "Integration tests for the Schunk SVH ROS2 driver";
  };
})
