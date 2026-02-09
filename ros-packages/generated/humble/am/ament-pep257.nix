{
  ament-flake8,
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
  pname = "ament_pep257";
  version = "0.12.14-1";
  src = finalAttrs.passthru.sources."ament_pep257";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pydocstyle" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pydocstyle" ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pep257" = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4cdfc63f0b091c2a7fa6af7c7d7b0078948b12bb";
        hash = "sha256-HOPXAXMXfldDfe18caM0diMFmjpwmtoi3jrqteei6xo=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against the docstring style conventions in\n    PEP 257 and generate xUnit test result files.\n  ";
  };
})
