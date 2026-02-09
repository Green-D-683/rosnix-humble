{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-euclidean-cluster-object-detector,
  autoware-ground-filter,
  autoware-lint-common,
  autoware-perception-objects-converter,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_perception";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_core_perception";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-euclidean-cluster-object-detector autoware-ground-filter autoware-perception-objects-converter ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-euclidean-cluster-object-detector autoware-ground-filter autoware-perception-objects-converter ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_perception" = substituteSource {
      src = fetchgit {
        name = "autoware_core_perception-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "89461617870b12939100cb150488956550e0f0f7";
        hash = "sha256-XFfElLWF2EJ3GQE+RdjygVlrDRsnP1TFnN0Sm2j1vfE=";
      };
    };
  });
  meta = {
    description = "The autoware_core_perception package";
  };
})
