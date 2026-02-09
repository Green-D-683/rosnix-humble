{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  gps-tools,
  gpsd-client,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gps_umd";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."gps_umd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gps-msgs gps-tools gpsd-client ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gps-msgs gps-tools gpsd-client ];
  passthru.sources = mkSourceSet (sources: {
    "gps_umd" = substituteSource {
      src = fetchgit {
        name = "gps_umd-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "bd8bb3a6c1c36cf40ed2dc5442d2440edf9654e8";
        hash = "sha256-ezm5Rry6uv9zrM69Usk+zq1ALXIkcIcOjNeDDmWAyXs=";
      };
    };
  });
  meta = {
    description = "gps_umd metapackage";
  };
})
