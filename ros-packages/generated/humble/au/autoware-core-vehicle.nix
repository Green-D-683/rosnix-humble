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
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_vehicle";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_core_vehicle";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ robot-state-publisher ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ robot-state-publisher ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_vehicle" = substituteSource {
      src = fetchgit {
        name = "autoware_core_vehicle-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "ceeca54c454b6e367316f1f6865049b9420117d9";
        hash = "sha256-SeIIBpBgHP3WnCFYCnEAr7LGR5Ledmv9mqUhcmLhkeY=";
      };
    };
  });
  meta = {
    description = "The autoware_core_vehicle package";
  };
})
