{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcgcrd-spl-4,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rcgcrd_spl_4_conversion";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."rcgcrd_spl_4_conversion";
  propagatedNativeBuildInputs = [ rcgcrd-spl-4 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-construct" ]; };
  propagatedBuildInputs = [ rcgcrd-spl-4 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rcgcrd_spl_4_conversion" = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "bc9f3efef8dd5f2475522dd1a14429712a5ab0a5";
        hash = "sha256-b3qZgc1SwKLODuUWxNW8EIoUN9Wsosi7dq5ge8NxHk4=";
      };
    };
  });
  meta = {
    description = "Converts RoboCup SPL GameController Return Data V4 between ROS msg and UDP raw bytes";
  };
})
