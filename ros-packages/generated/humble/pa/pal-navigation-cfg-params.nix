{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_navigation_cfg_params";
  version = "3.0.6-1";
  src = finalAttrs.passthru.sources."pal_navigation_cfg_params";
  nativeBuildInputs = [ ament-cmake-auto ];
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_navigation_cfg_params" = substituteSource {
      src = fetchgit {
        name = "pal_navigation_cfg_params-source";
        url = "https://github.com/pal-gbp/pal_navigation_cfg_public-release.git";
        rev = "5cc4118e1f1c5493d7e9083d715f3cbf967a7b8f";
        hash = "sha256-rf4mzxiz6tOTAeDFUng1RkBMmQ9ieKPw17pvNaQPFJg=";
      };
    };
  });
  meta = {
    description = "Central storage of navigation configuration parameters";
  };
})
