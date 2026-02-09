{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-hey5-controller-configuration,
  pal-hey5-description,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_hey5";
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."pal_hey5";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ pal-hey5-controller-configuration pal-hey5-description ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pal-hey5-controller-configuration pal-hey5-description ];
  passthru.sources = mkSourceSet (sources: {
    "pal_hey5" = substituteSource {
      src = fetchgit {
        name = "pal_hey5-source";
        url = "https://github.com/pal-gbp/pal_hey5-release.git";
        rev = "b2201ad931dc8138ba8ee8759b6fd4c45a34e657";
        hash = "sha256-T+KuXhVpkS3QC7Bff+qXAxMcBLg6zUXDLKoCGWq/efc=";
      };
    };
  });
  meta = {
    description = "The pal_hey5 package";
  };
})
