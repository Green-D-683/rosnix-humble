{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "console_bridge_vendor";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."console_bridge_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libconsole-bridge-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "console_bridge_vendor" = substituteSource {
      src = fetchgit {
        name = "console_bridge_vendor-source";
        url = "https://github.com/ros2-gbp/console_bridge_vendor-release.git";
        rev = "365230890ff7502a0bb63ef4ae3f23d444dddd2a";
        hash = "sha256-lgsqEU/ZyaZfte3s7Mz+RKYl2uUUl4DmbGxEih952r8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/ros/console_bridge/archive/1.0.2.tar.gz";
          to = "URL ${sources."console_bridge_vendor/1"}";
        }
      ];
    };
    "console_bridge_vendor/1" = substituteSource {
      src = fetchzip {
        name = "1-source";
        url = "https://github.com/ros/console_bridge/archive/1.0.2.tar.gz";
        hash = "sha256-M3GocT0hodw3Sc2NHcFDiPVZ1XN7BqIUuYLW8OaXMqM=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around console_bridge, providing nothing but a dependency on console_bridge, on some systems.\n    On others, it provides an ExternalProject build of console_bridge.\n  ";
  };
})
