{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_maps";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."pal_maps";
  nativeBuildInputs = [ ament-cmake-auto ];
  buildInputs = [ ament-cmake-auto ];
  passthru.sources = mkSourceSet (sources: {
    "pal_maps" = substituteSource {
      src = fetchgit {
        name = "pal_maps-source";
        url = "https://github.com/pal-gbp/pal_maps-release.git";
        rev = "db6aad5079e53591ce1b4ebcd6166855e8a43864";
        hash = "sha256-Pl4uJg8OPuzrpjesiC9+zF0qMSTQjHQMbKrL8NqzXIc=";
      };
    };
  });
  meta = {
    description = "Public Maps used for the Navigation of PAL Robotics robots.";
  };
})
