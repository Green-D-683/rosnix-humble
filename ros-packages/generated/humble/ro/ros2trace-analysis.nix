{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  tracetools-analysis,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2trace_analysis";
  version = "3.0.0-4";
  src = finalAttrs.passthru.sources."ros2trace_analysis";
  propagatedNativeBuildInputs = [ ros2cli tracetools-analysis ];
  propagatedBuildInputs = [ ros2cli tracetools-analysis ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2trace_analysis" = substituteSource {
      src = fetchgit {
        name = "ros2trace_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "a8e3b1d8f19535b090c7f9c11baacd05a63838ce";
        hash = "sha256-88nEQ39lxqn4A5k9lH63DZqI0nV7umn2QUpbOCQyVpE=";
      };
    };
  });
  meta = {
    description = "The trace-analysis command for ROS 2 command line tools.";
  };
})
