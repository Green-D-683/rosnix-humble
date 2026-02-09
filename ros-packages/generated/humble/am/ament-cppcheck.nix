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
  pname = "ament_cppcheck";
  version = "0.12.14-1";
  src = finalAttrs.passthru.sources."ament_cppcheck";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cppcheck" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1acbaf45e2e06ef544f222a7f435df8a81082c46";
        hash = "sha256-XSXeBAFVWzSdAY54rqANOyUkOyCi2kbc18vdMXXOBiU=";
      };
    };
  });
  meta = {
    description = "\n    The ability to perform static code analysis on C/C++ code using Cppcheck\n    and generate xUnit test result files.\n  ";
  };
})
