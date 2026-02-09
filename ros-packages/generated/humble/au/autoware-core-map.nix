{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lanelet2-map-visualizer,
  autoware-lint-common,
  autoware-map-loader,
  autoware-map-projection-loader,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_map";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_core_map";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-map-visualizer autoware-map-loader autoware-map-projection-loader ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-map-visualizer autoware-map-loader autoware-map-projection-loader ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_map" = substituteSource {
      src = fetchgit {
        name = "autoware_core_map-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "0cd9c05b64dfc15b00b8f1a576fb0ad5fb6b25fb";
        hash = "sha256-hbHnW/CPXoHzJmTDWoJN4iIrr96Zn9RZ9R3gAF0jtmU=";
      };
    };
  });
  meta = {
    description = "The autoware_core_map package";
  };
})
