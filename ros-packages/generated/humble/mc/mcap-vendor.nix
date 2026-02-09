{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  zstd-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mcap_vendor";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."mcap_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ zstd-vendor ];
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ zstd-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "mcap_vendor" = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "aef9a46feb0e3fe2c792970da8239a52d68b73a6";
        hash = "sha256-b8q5zWGDgjb7ebnpaJ9NN0F8voKPMnWYSX2zdMTyD88=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/lz4/lz4.git";
          to = "URL ${sources."mcap_vendor/lz4"}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v0.8.0.tar.gz";
          to = "URL ${sources."mcap_vendor/v0"}";
        }
      ];
    };
    "mcap_vendor/lz4" = substituteSource {
      src = fetchgit {
        name = "lz4-source";
        url = "https://github.com/lz4/lz4.git";
        rev = "d44371841a2f1728a3f36839fd4b7e872d0927d3";
        hash = "sha256-f7GZgOzUrkAfw1mqwlIKQQqDvkvIahGlHvq6AL+aAvA=";
      };
    };
    "mcap_vendor/v0" = substituteSource {
      src = fetchzip {
        name = "v0-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v0.8.0.tar.gz";
        hash = "sha256-cbUuXSRtYKGw0kIObCayG8q8EGaRn8PTls3ZvaxKblw=";
      };
    };
  });
  meta = {
    description = "mcap vendor package";
  };
})
