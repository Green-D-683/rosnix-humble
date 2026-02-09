{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  omni-base-2dnav,
  omni-base-laser-sensors,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_base_navigation";
  version = "2.19.1-1";
  src = finalAttrs.passthru.sources."omni_base_navigation";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ omni-base-2dnav omni-base-laser-sensors ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ omni-base-2dnav omni-base-laser-sensors ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_navigation" = substituteSource {
      src = fetchgit {
        name = "omni_base_navigation-source";
        url = "https://github.com/pal-gbp/omni_base_navigation-release.git";
        rev = "520550ac893238f9fd9ee70d0c29716912ee8905";
        hash = "sha256-Qsh1Ls/aOHOtf6vJVH0rQgr+qg0l8X8hT6tG9lR8i+g=";
      };
    };
  });
  meta = {
    description = "The omni_base Navigatgion metapackage";
  };
})
