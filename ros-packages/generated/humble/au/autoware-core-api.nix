{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-adapi-adaptors,
  autoware-cmake,
  autoware-default-adapi,
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
  pname = "autoware_core_api";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_core_api";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-adaptors autoware-default-adapi ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-adaptors autoware-default-adapi ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_api" = substituteSource {
      src = fetchgit {
        name = "autoware_core_api-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "a0a624ae2099271d113bac337949f81f58198d9e";
        hash = "sha256-4pmT5uWb8jP717+HGBiZcb7+HQP/HzrsO0pv5aRVRsA=";
      };
    };
  });
  meta = {
    description = "The autoware_core_api package";
  };
})
