{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  buildAmentPythonPackage,
  caret-analyze,
  caret-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  tracetools-trace,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2caret";
  version = "0.5.0-6";
  src = finalAttrs.passthru.sources."ros2caret";
  propagatedNativeBuildInputs = [ caret-analyze caret-msgs ros2cli tracetools-trace ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tabulate" ]; };
  propagatedBuildInputs = [ caret-analyze caret-msgs ros2cli tracetools-trace ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tabulate" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2caret" = substituteSource {
      src = fetchgit {
        name = "ros2caret-source";
        url = "https://github.com/ros2-gbp/ros2caret-release.git";
        rev = "f48972ba4ed03749c27bece6eeb6e64e5e4cecec";
        hash = "sha256-0mOrjDB4/Yi4Eo/1VuUfgLqFdPlvtUXKwVax0YjaVIg=";
      };
    };
  });
  meta = {
    description = "ROS 2 CLI package for caret";
  };
})
