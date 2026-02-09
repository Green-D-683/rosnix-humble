{
  ament-cmake-auto,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_base_rgbd_sensors";
  version = "2.19.1-1";
  src = finalAttrs.passthru.sources."omni_base_rgbd_sensors";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-updater ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-updater ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_rgbd_sensors" = substituteSource {
      src = fetchgit {
        name = "omni_base_rgbd_sensors-source";
        url = "https://github.com/pal-gbp/omni_base_navigation-release.git";
        rev = "28c6a2441faac33c16504cc9bd323f2c4397de79";
        hash = "sha256-rdNvZ6SxMNUaeUjJ1siPgzKw1Ieyt0MZOyXssWEmbJ8=";
      };
    };
  });
  meta = {
    description = "omni_base-specific RGBD sensors module and params files.";
  };
})
