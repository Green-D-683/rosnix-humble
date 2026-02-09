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
  pname = "spdlog_vendor";
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."spdlog_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "spdlog" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "spdlog" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "spdlog_vendor" = substituteSource {
      src = fetchgit {
        name = "spdlog_vendor-source";
        url = "https://github.com/ros2-gbp/spdlog_vendor-release.git";
        rev = "43818fb2f0ba4af12876cc909d548dc3dfb7d01c";
        hash = "sha256-9OjlnEOVpDKHMl/hyC8ZNdcnIFsbSxbkf+URjeyVWZA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz";
          to = "URL ${sources."spdlog_vendor/v1"}";
        }
      ];
    };
    "spdlog_vendor/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz";
        hash = "sha256-vYled5Z9fmxuO9193lefpFzIHAiSgvYn2iOfneLidQ8=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${sources."spdlog_vendor/v1/benchmark"}";
        }
      ];
    };
    "spdlog_vendor/v1/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "73d4d5e8d6d449fc8663765a42aa8aeeee844489";
        hash = "sha256-6gKLIKPnY7eXWGQcaWyPbLs3E6Q9VyqVoWoZ/u9TPY8=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around spdlog, providing nothing but a dependency on spdlog, on some systems.\n    On others, it provides an ExternalProject build of spdlog.\n  ";
  };
})
