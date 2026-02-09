{
  ament-lint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_flake8";
  version = "0.12.14-1";
  src = finalAttrs.passthru.sources."ament_flake8";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-flake8" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_flake8" = substituteSource {
      src = fetchgit {
        name = "ament_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "b97115ca631636e2aca6e39b2b983986c58e422f";
        hash = "sha256-f52PpiZ4IPZNsSHJ+5QHlqCXeazVC0i6Z9mvr5ILTqo=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code for style and syntax conventions with flake8.\n  ";
  };
})
