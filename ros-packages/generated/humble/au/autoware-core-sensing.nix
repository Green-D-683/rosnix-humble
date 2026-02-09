{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-vehicle-velocity-converter,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_sensing";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_core_sensing";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-vehicle-velocity-converter ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-vehicle-velocity-converter ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_sensing" = substituteSource {
      src = fetchgit {
        name = "autoware_core_sensing-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "21cb08381477a1fe1285926de4e7e6df5fc738e0";
        hash = "sha256-hpQ5MZkfrytZE+e8I+5NZYpjAjAzehGBP6Ilua6gANQ=";
      };
    };
  });
  meta = {
    description = "The autoware_core_sensing package";
  };
})
