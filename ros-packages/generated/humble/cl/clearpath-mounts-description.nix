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
  pname = "clearpath_mounts_description";
  version = "1.3.9-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "134570e5ce1c5bdcc7baab67625bb2ac3f9a11bb";
        hash = "sha256-Po3muUS3EYy4ByEm9fZJPEbAVs6fx6EpBa7tGNV4ANM=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
