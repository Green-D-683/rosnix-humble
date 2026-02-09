{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  py-trees,
  py-trees-ros,
  py-trees-ros-interfaces,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  scenario-execution,
  scenario-execution-py-trees-ros,
  substituteSource,
  visualization-msgs,
  xacro,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_ros";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."scenario_execution_ros";
  propagatedNativeBuildInputs = [ py-trees py-trees-ros py-trees-ros-interfaces rcl-interfaces rclpy scenario-execution scenario-execution-py-trees-ros visualization-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-transforms3d" ]; };
  propagatedBuildInputs = [ py-trees py-trees-ros py-trees-ros-interfaces rcl-interfaces rclpy scenario-execution scenario-execution-py-trees-ros visualization-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_ros" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_ros-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "bde3cc436dfc818b32e7e47337af862a871f1ba8";
        hash = "sha256-2BG0Q2VfSyeLXacaP5iF9S1S1SX1x3KJ818leMOqMpk=";
      };
    };
  });
  meta = {
    description = "Scenario Execution for ROS";
  };
})
