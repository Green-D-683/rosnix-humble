{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_adapi_specs";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_adapi_specs";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_specs" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_specs-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "af43ae91a335d501eb5b19ced0d76876997cf767";
        hash = "sha256-w/DAv2bm6CVxZspkvB+mCiHukrBh2Q2BvnEkYaU3uRM=";
      };
    };
  });
  meta = {
    description = "The autoware_adapi_specs package";
  };
})
