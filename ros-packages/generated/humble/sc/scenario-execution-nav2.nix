{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav2-msgs,
  nav2-simple-commander,
  rclpy,
  rosSystemPackages,
  scenario-execution-ros,
  substituteSource,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_nav2";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."scenario_execution_nav2";
  propagatedNativeBuildInputs = [ geometry-msgs lifecycle-msgs nav2-msgs nav2-simple-commander rclpy scenario-execution-ros tf2-ros ];
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs nav2-msgs nav2-simple-commander rclpy scenario-execution-ros tf2-ros ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_nav2" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_nav2-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "ec43f58556ff8f986d586a71f603faa662884994";
        hash = "sha256-fUFKyw5Ih3f9tsoyxu+xbmPnncK2Pvtz8bk3w+YhSZo=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for Nav2";
  };
})
