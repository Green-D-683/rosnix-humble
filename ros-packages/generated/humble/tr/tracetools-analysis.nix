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
  rosSystemPackages,
  substituteSource,
  tracetools-read,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_analysis";
  version = "3.0.0-4";
  src = finalAttrs.passthru.sources."tracetools_analysis";
  propagatedNativeBuildInputs = [ tracetools-read ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "jupyter-notebook" "python3-pandas" ]; };
  propagatedBuildInputs = [ tracetools-read ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "jupyter-notebook" "python3-pandas" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_analysis" = substituteSource {
      src = fetchgit {
        name = "tracetools_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "704228283a0d07032f1a3f67259665c9fec79c09";
        hash = "sha256-DPKjLLYf07C3NN4cCJqYVc28MZaOWmDTrLO+g2oyGwA=";
      };
    };
  });
  meta = {
    description = "Tools for analysing trace data.";
  };
})
