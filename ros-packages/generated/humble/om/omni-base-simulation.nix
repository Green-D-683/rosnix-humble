{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  omni-base-gazebo,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_base_simulation";
  version = "2.10.1-1";
  src = finalAttrs.passthru.sources."omni_base_simulation";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ omni-base-gazebo ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ omni-base-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_simulation" = substituteSource {
      src = fetchgit {
        name = "omni_base_simulation-source";
        url = "https://github.com/pal-gbp/omni_base_simulation-release.git";
        rev = "7eb088d55377115497290a38262728f2050f536d";
        hash = "sha256-X4CdlyPK1kwR47/8LgXijSQO04ZgjR0Pn3hub2A2RgM=";
      };
    };
  });
  meta = {
    description = "The omni_base_simulation package";
  };
})
