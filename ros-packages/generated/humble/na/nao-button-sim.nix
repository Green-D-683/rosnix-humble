{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nao-sensor-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "nao_button_sim";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."nao_button_sim";
  propagatedNativeBuildInputs = [ nao-sensor-msgs ];
  propagatedBuildInputs = [ nao-sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nao_button_sim" = substituteSource {
      src = fetchgit {
        name = "nao_button_sim-source";
        url = "https://github.com/ros2-gbp/nao_button_sim-release.git";
        rev = "f434ad48607a9b6c2f98c9e38fb5fe975af943f4";
        hash = "sha256-rImNSTTVSFL8VO9w+jMHyItFuq8VYc+IgiywuXdSi7k=";
      };
    };
  });
  meta = {
    description = "Allows simulating button presses through command line interface";
  };
})
