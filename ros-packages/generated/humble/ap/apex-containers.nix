{
  ament-cmake,
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  apex-test-tools,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  foonathan-memory-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apex_containers";
  version = "0.0.4-3";
  src = finalAttrs.passthru.sources."apex_containers";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedNativeBuildInputs = [ foonathan-memory-vendor ];
  buildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedBuildInputs = [ foonathan-memory-vendor ];
  checkInputs = [ ament-lint-auto ament-lint-common apex-test-tools ];
  passthru.sources = mkSourceSet (sources: {
    "apex_containers" = substituteSource {
      src = fetchgit {
        name = "apex_containers-source";
        url = "https://github.com/ros2-gbp/apex_containers-release.git";
        rev = "377b63c3af9da61c7ee03a8275df1582270bf161";
        hash = "sha256-01lF2ZodmNGfazVwwxuHKPBMihyBFcKcwU2K6tpJxmk=";
      };
    };
  });
  meta = {
    description = "Containers";
  };
})
