{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid-map-cmake-helpers,
  grid-map-core,
  mkSourceSet,
  octomap,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_octomap";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."grid_map_octomap";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-core octomap ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core octomap ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_octomap" = substituteSource {
      src = fetchgit {
        name = "grid_map_octomap-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "8bf24e5a1695b47733682e1294e140cab1d8ee70";
        hash = "sha256-ZFnD6jRQDIpnpjmfb3B0h3ZFvxn7zOT8JJIdtT6yCE0=";
      };
    };
  });
  meta = {
    description = "Conversions between grid maps and OctoMap types.";
  };
})
