{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcl,
  rcpputils,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  statistics-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libstatistics_collector";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."libstatistics_collector";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl rcpputils rosidl-default-generators rosidl-default-runtime statistics-msgs std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl rcpputils rosidl-default-generators rosidl-default-runtime statistics-msgs std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "libstatistics_collector" = substituteSource {
      src = fetchgit {
        name = "libstatistics_collector-source";
        url = "https://github.com/ros2-gbp/libstatistics_collector-release.git";
        rev = "3562e7fe56d3f98e2880c04127f1f13e9eeea3d3";
        hash = "sha256-i1aXt0/iGyyPvJwK5MwByKalCSswEvRqp2YI0qWrHrA=";
      };
    };
  });
  meta = {
    description = "Lightweight aggregation utilities to collect statistics and measure message metrics.";
  };
})
