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
  pname = "axis_description";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."axis_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "axis_description" = substituteSource {
      src = fetchgit {
        name = "axis_description-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "a67b945ce48357ab582b4cc413cd60366f1dba82";
        hash = "sha256-M8yAQhEq7E6oXdjnSLPPKrpJOxfcLuv61r76gHA6uJ8=";
      };
    };
  });
  meta = {
    description = "Description package with URDF files for common Axis fixed and PTZ cameras";
  };
})
