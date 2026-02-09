{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fogros2,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "fogros2_examples";
  version = "0.1.7-1";
  src = finalAttrs.passthru.sources."fogros2_examples";
  propagatedNativeBuildInputs = [ fogros2 ];
  propagatedBuildInputs = [ fogros2 ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fogros2_examples" = substituteSource {
      src = fetchgit {
        name = "fogros2_examples-source";
        url = "https://github.com/ros2-gbp/fogros2-release.git";
        rev = "a1afb6b4adc434fc77a89b93e8fc98aac6c9a54b";
        hash = "sha256-Q88Rh23VRS6EUyEY8/Bjj9Ov9QZTCl3Hd5zEGY1uIUk=";
      };
    };
  });
  meta = {
    description = "Examples using FogROS2";
  };
})
