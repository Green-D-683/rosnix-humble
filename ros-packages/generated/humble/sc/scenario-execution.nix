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
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."scenario_execution";
  propagatedNativeBuildInputs = [ py-trees ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-antlr4" "python3-yaml" ]; };
  propagatedBuildInputs = [ py-trees ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-antlr4" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution" = substituteSource {
      src = fetchgit {
        name = "scenario_execution-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "9a7a96b043aa6e2f78115ea22c5280b02ff22372";
        hash = "sha256-ebZi9/OvRk3zDwZROu0ksQLJ21o5Obuc17wu7wCLZQ4=";
      };
    };
  });
  meta = {
    description = "Scenario Execution";
  };
})
