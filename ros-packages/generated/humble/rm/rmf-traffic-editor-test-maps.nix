{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-building-map-tools,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_traffic_editor_test_maps";
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_test_maps";
  nativeBuildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  buildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_test_maps" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_test_maps-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "67676526473bb1a139503a3385082f4243e72438";
        hash = "sha256-9QLzqbr72EwXrnOx19meM7c5FkD6d5YxiaP7MvxfPgc=";
      };
    };
  });
  meta = {
    description = "\n    Some test maps for traffic_editor and rmf_building_map_tools.\n  ";
  };
})
