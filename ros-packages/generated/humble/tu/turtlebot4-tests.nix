{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  turtlebot4-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot4_tests";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_tests";
  propagatedNativeBuildInputs = [ irobot-create-msgs sensor-msgs std-msgs turtlebot4-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-psutil" ]; };
  propagatedBuildInputs = [ irobot-create-msgs sensor-msgs std-msgs turtlebot4-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-psutil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_tests" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_tests-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "f2fd6e370dc7da33564b183e8a0709c13ec428f3";
        hash = "sha256-FwD7L/4XgL2f613gS4AQXG1Who9jNHPyKqCqW5Sgu3o=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 System Tests";
  };
})
