{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  scenario-execution,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_coverage";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."scenario_execution_coverage";
  propagatedNativeBuildInputs = [ scenario-execution ];
  propagatedBuildInputs = [ scenario-execution ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-pexpect" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_coverage" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_coverage-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "8b4c6d1894222d196284e700d83c2ddfeeb448a7";
        hash = "sha256-bU4ri8j7dGcqU81T+B9SLkrXKyR6exq8V3KLgjnoC1A=";
      };
    };
  });
  meta = {
    description = "Robotics Scenario Execution Coverage Tools";
  };
})
