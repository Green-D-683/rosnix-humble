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
  pname = "sqlite3_vendor";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."sqlite3_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libsqlite3-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sqlite3_vendor" = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d3a4d35aaa0270ff491dc18c6953df5ff0717b97";
        hash = "sha256-EQHt139N0RRgydO7qxGqN1plOMXp/kjq0xOBF2FuHJo=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.sqlite.org/2018/sqlite-amalgamation-3240000.zip";
          to = "URL ${sources."sqlite3_vendor/sqlite-amalgamation-3240000"}";
        }
      ];
    };
    "sqlite3_vendor/sqlite-amalgamation-3240000" = substituteSource {
      src = fetchzip {
        name = "sqlite-amalgamation-3240000-source";
        url = "https://www.sqlite.org/2018/sqlite-amalgamation-3240000.zip";
        hash = "sha256-0NvEoh4gUXGvD2VquiAoqgvx7JgVYU8WUfHzN/z0DNc=";
      };
    };
  });
  meta = {
    description = "SQLite 3 vendor package";
  };
})
