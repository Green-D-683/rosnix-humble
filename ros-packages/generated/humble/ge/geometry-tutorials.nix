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
  pname = "geometry_tutorials";
  version = "0.3.7-1";
  src = finalAttrs.passthru.sources."geometry_tutorials";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "geometry_tutorials" = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "dd7edbcf64f5df7823307f2db5c18d47cfa4ccea";
        hash = "sha256-r4Vt4xUHIl5j69h99eM00KHYmUR78dcAd43UzNITElk=";
      };
    };
  });
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
})
