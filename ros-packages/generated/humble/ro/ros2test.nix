{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  domain-coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2test";
  version = "0.4.0-3";
  src = finalAttrs.passthru.sources."ros2test";
  propagatedNativeBuildInputs = [ domain-coordinator launch launch-ros launch-testing launch-testing-ros ros2cli ];
  propagatedBuildInputs = [ domain-coordinator launch launch-ros launch-testing launch-testing-ros ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2test" = substituteSource {
      src = fetchgit {
        name = "ros2test-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "0a986fbd27857ff5d1f2a7937e1ac127e61fe59b";
        hash = "sha256-0ct2zxFuOGf8MCy8K08EszVJLrK4DTFg2kn5JpqzLr0=";
      };
    };
  });
  meta = {
    description = "The test command for ROS 2 launch tests.";
  };
})
