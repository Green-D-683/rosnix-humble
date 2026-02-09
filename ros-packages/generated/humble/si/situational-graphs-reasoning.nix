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
  situational-graphs-datasets,
  situational-graphs-msgs,
  situational-graphs-reasoning-msgs,
  situational-graphs-wrapper,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "situational_graphs_reasoning";
  version = "0.0.1-1";
  src = finalAttrs.passthru.sources."situational_graphs_reasoning";
  propagatedNativeBuildInputs = [ situational-graphs-datasets situational-graphs-msgs situational-graphs-reasoning-msgs situational-graphs-wrapper ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-colorama" "python3-matplotlib" "python3-networkx" "python3-numpy" "python3-protobuf" "python3-pytorch-pip" "python3-seaborn" "python3-shapely" "python3-torch-geometric-pip" ]; };
  propagatedBuildInputs = [ situational-graphs-datasets situational-graphs-msgs situational-graphs-reasoning-msgs situational-graphs-wrapper ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-colorama" "python3-matplotlib" "python3-networkx" "python3-numpy" "python3-protobuf" "python3-pytorch-pip" "python3-seaborn" "python3-shapely" "python3-torch-geometric-pip" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "situational_graphs_reasoning" = substituteSource {
      src = fetchgit {
        name = "situational_graphs_reasoning-source";
        url = "https://github.com/ros2-gbp/situational_graphs_reasoning-release.git";
        rev = "81ff076ca29b0349c6097144f2b1b8a5165f83c6";
        hash = "sha256-KRvin/Xk05j3hP6daOAk4Yg7+eVSprJhmesgnRcyrLc=";
      };
    };
  });
  meta = {
    description = "Graph reasoning for extracting semantic concepts using GNNs";
  };
})
