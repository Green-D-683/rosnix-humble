{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_yaml";
  version = "1.0.14-1";
  src = finalAttrs.passthru.sources."launch_yaml";
  propagatedNativeBuildInputs = [ launch ];
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_yaml" = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "f8416d38b8c38c36e66500d482a3ca43c5afbfef";
        hash = "sha256-7uOVrQR8ZVt9cGobB2975hIBtuLd+VewPSDG2L6yJik=";
      };
    };
  });
  meta = {
    description = "YAML frontend for the launch package.";
  };
})
