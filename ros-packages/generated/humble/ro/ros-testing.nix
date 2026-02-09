{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-export-dependencies,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  ros2test,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_testing";
  version = "0.4.0-3";
  src = finalAttrs.passthru.sources."ros_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies launch-testing launch-testing-ament-cmake launch-testing-ros ros2test ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies launch-testing launch-testing-ament-cmake launch-testing-ros ros2test ];
  passthru.sources = mkSourceSet (sources: {
    "ros_testing" = substituteSource {
      src = fetchgit {
        name = "ros_testing-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "d967927d4fd56ff3d6b07a5691d67b14699f8e32";
        hash = "sha256-sUwtH8qmHyoxmIc0wz8dHJFON0w90U1JFymI3aV6c1U=";
      };
    };
  });
  meta = {
    description = "The entry point package to launch testing in ROS.";
  };
})
