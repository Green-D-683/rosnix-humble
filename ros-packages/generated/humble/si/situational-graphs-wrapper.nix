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
  pname = "situational_graphs_wrapper";
  version = "0.0.0-1";
  src = finalAttrs.passthru.sources."situational_graphs_wrapper";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "situational_graphs_wrapper" = substituteSource {
      src = fetchgit {
        name = "situational_graphs_wrapper-source";
        url = "https://github.com/ros2-gbp/situational_graphs_wrapper-release.git";
        rev = "7f6b49b11d1d833c194a9e9a892f3e557a04ac1c";
        hash = "sha256-0Mux6SmU7ePXTtYkXJDylhVdeWnOzMzGIKc2BHlfk5E=";
      };
    };
  });
  meta = {
    description = "Graph wrapper for situational_graphs_wrapper repo";
  };
})
