{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  soccer-vision-2d-msgs,
  soccer-vision-3d-msgs,
  soccer-vision-attribute-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_interfaces";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."soccer_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ soccer-vision-2d-msgs soccer-vision-3d-msgs soccer-vision-attribute-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ soccer-vision-2d-msgs soccer-vision-3d-msgs soccer-vision-attribute-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_interfaces" = substituteSource {
      src = fetchgit {
        name = "soccer_interfaces-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "2224909394318a66fc75e1c96e4345ebe9377ca5";
        hash = "sha256-4lOFn2p0uaDcS/4mDfWG/Q1OGsw8t1EAYJWVsHD6k+M=";
      };
    };
  });
  meta = {
    description = "Metapackage for soccer-related interfaces";
  };
})
