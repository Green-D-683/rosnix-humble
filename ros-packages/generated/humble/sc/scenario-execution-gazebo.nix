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
  rclpy,
  rosSystemPackages,
  scenario-execution-ros,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_gazebo";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."scenario_execution_gazebo";
  propagatedNativeBuildInputs = [ py-trees rclpy scenario-execution-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-defusedxml" "python3-transforms3d" ]; };
  propagatedBuildInputs = [ py-trees rclpy scenario-execution-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_gazebo" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_gazebo-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "13f57e351fa6c91464265a5adf7862216479195a";
        hash = "sha256-s7hBkU/CHg+kEWSSuOsKowtA7YG/fhiDEmNkQ6NLJYA=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for Gazebo";
  };
})
