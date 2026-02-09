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
  splsm-8,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "splsm_8_conversion";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."splsm_8_conversion";
  propagatedNativeBuildInputs = [ splsm-8 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-construct" ]; };
  propagatedBuildInputs = [ splsm-8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "splsm_8_conversion" = substituteSource {
      src = fetchgit {
        name = "splsm_8_conversion-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "8252a08492202fbb6582194bd7b7465435b052a9";
        hash = "sha256-JFwL2GR/REst5zNuUWumSf5/+Us1BewHvhTe2A7T89k=";
      };
    };
  });
  meta = {
    description = "Converts Standard Platform League Standard Message V8 between ROS msg and UDP raw bytes";
  };
})
