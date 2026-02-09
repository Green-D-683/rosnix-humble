{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "caret_analyze";
  version = "0.5.0-2";
  src = finalAttrs.passthru.sources."caret_analyze";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphviz" "graphviz-dev" "python3-colorcet" "python3-graphviz" "python3-setuptools" "python3-tqdm" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" "graphviz-dev" "python3-colorcet" "python3-graphviz" "python3-setuptools" "python3-tqdm" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "caret_analyze" = substituteSource {
      src = fetchgit {
        name = "caret_analyze-source";
        url = "https://github.com/ros2-gbp/caret_analyze-release.git";
        rev = "d95760aa55ae23c6958bfbfd940952c9e02b5ce1";
        hash = "sha256-5qfscOKRD6zC8BIAY31MMFt5Ca4tSlNtdSXjwMsxjtw=";
      };
    };
  });
  meta = {
    description = "CARET's tools for analyzing trace results";
  };
})
