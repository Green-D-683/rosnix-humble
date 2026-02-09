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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "situational_graphs_datasets";
  version = "0.0.0-1";
  src = finalAttrs.passthru.sources."situational_graphs_datasets";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-matplotlib" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-matplotlib" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "situational_graphs_datasets" = substituteSource {
      src = fetchgit {
        name = "situational_graphs_datasets-source";
        url = "https://github.com/ros2-gbp/situational_graphs_dataset-release.git";
        rev = "d1c6f328541c6804859d4b373d9efd0ce9342a02";
        hash = "sha256-MX0nvPaE+OW0VS6v+GToiVp7wBcZJS1z5EoEAKwsAPo=";
      };
    };
  });
  meta = {
    description = "Graph datasets for situational_graphs_reasoning repo";
  };
})
