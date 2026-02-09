{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcgcd-spl-14,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rcgcd_spl_14_conversion";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."rcgcd_spl_14_conversion";
  propagatedNativeBuildInputs = [ rcgcd-spl-14 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-construct" ]; };
  propagatedBuildInputs = [ rcgcd-spl-14 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rcgcd_spl_14_conversion" = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "0270227fc629a1d53e5cb96f9a407d2e04e22672";
        hash = "sha256-+ZAqwS6MuQ53xvcwFVCIGWBuZgKQtSaYJJaUr4roAzM=";
      };
    };
  });
  meta = {
    description = "Converts RoboCup SPL GameController Data V14 between ROS msg and UDP raw bytes";
  };
})
