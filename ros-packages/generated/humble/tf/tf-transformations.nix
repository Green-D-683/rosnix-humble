{
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
  pname = "tf_transformations";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."tf_transformations";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-transforms3d" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-transforms3d" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf_transformations" = substituteSource {
      src = fetchgit {
        name = "tf_transformations-source";
        url = "https://github.com/ros2-gbp/tf_transformations_release.git";
        rev = "c21b0f3eedd971c8bfc0c5311cffd9d4663a107c";
        hash = "sha256-ojeOIsR7yaPVDfd/6N3cPt6MShybAcLZlBQWNpOt64g=";
      };
    };
  });
  meta = {
    description = "\n      Reimplementation of the tf/transformations.py library for common Python spatial operations\n  ";
  };
})
