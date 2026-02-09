{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zstd_vendor";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."zstd_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzstd-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "zstd_vendor" = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "8ca36ec4364d8b5a7ddabfd6135bd54fa07dc6e5";
        hash = "sha256-Jg4eQmcngSDRB4XIueY7zInGM+D/Z0SbFtdS2VZlFVo=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/facebook/zstd.git";
          to = "URL ${sources."zstd_vendor/zstd"}";
        }
      ];
    };
    "zstd_vendor/zstd" = substituteSource {
      src = fetchgit {
        name = "zstd-source";
        url = "https://github.com/facebook/zstd.git";
        rev = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee";
        hash = "sha256-pGwxFsztrO8E5m7w2Oa/GiiLwr+YKmnpooKjShrKx34=";
      };
    };
  });
  meta = {
    description = "Zstd compression vendor package, providing a dependency for Zstd.";
  };
})
