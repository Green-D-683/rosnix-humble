{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mimick_vendor";
  version = "0.2.8-2";
  src = finalAttrs.passthru.sources."mimick_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mimick_vendor" = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-source";
        url = "https://github.com/ros2-gbp/mimick_vendor-release.git";
        rev = "c2c7cccbfa6551d7fc2bc10a126313e45c963c0b";
        hash = "sha256-sbNAgZZ3wA7YkE29bq92nb4sQVmKXyHozHQdf4kutK4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ros2/Mimick.git";
          to = "URL ${sources."mimick_vendor/Mimick"}";
        }
      ];
    };
    "mimick_vendor/Mimick" = substituteSource {
      src = fetchgit {
        name = "Mimick-source";
        url = "https://github.com/ros2/Mimick.git";
        rev = "de11f8377eb95f932a03707b583bf3d4ce5bd3e7";
        hash = "sha256-adCxIl0F3QkgSimOhvuTyhmig1rFy/K9wxZ/+YCuxYo=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around mimick, it provides an ExternalProject build of mimick.\n  ";
  };
})
