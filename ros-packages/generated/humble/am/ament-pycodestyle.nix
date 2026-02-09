{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_pycodestyle";
  version = "0.12.14-1";
  src = finalAttrs.passthru.sources."ament_pycodestyle";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pycodestyle" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pycodestyle" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pycodestyle" = substituteSource {
      src = fetchgit {
        name = "ament_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9e35344a742b3ef717143f8f549e8a6df84d947a";
        hash = "sha256-45h5wvLLnd/c8G0cUQWGaGfOvhf7Xg/yVeHMgsxWpg4=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against the style conventions in PEP 8 and\n    generate xUnit test result files.\n  ";
  };
})
