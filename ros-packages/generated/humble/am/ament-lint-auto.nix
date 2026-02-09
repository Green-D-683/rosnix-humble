{
  ament-cmake-core,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_lint_auto";
  version = "0.12.14-1";
  src = finalAttrs.passthru.sources."ament_lint_auto";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_auto" = substituteSource {
      src = fetchgit {
        name = "ament_lint_auto-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "fc055fc2b0f8cc775a630fc50b7963de53212936";
        hash = "sha256-aFrYws/i8pUp+71y65MR5B+QehxM1zrkqrpBxJgPKzE=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament linters in CMake.";
  };
})
