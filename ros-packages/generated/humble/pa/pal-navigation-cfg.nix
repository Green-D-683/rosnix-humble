{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-navigation-cfg-bringup,
  pal-navigation-cfg-params,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_navigation_cfg";
  version = "3.0.6-1";
  src = finalAttrs.passthru.sources."pal_navigation_cfg";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pal-navigation-cfg-bringup pal-navigation-cfg-params ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pal-navigation-cfg-bringup pal-navigation-cfg-params ];
  passthru.sources = mkSourceSet (sources: {
    "pal_navigation_cfg" = substituteSource {
      src = fetchgit {
        name = "pal_navigation_cfg-source";
        url = "https://github.com/pal-gbp/pal_navigation_cfg_public-release.git";
        rev = "8f86042849801f74a2b0afb84e0e1d6b09ded4a3";
        hash = "sha256-/qdP/jy709cA4ZlGnWnvDUZ7aNmPojRxPm1i5rLPAPA=";
      };
    };
  });
  meta = {
    description = "PAL Navigation Configuration metapackage";
  };
})
