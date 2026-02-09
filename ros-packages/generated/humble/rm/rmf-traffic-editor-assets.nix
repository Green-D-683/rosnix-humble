{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_traffic_editor_assets";
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_assets";
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "ae6fe627a23d9f327f24d825f2fb5f1fbcf4a4b4";
        hash = "sha256-/d1LzTFBtvc2le+0m2934MWwFCtGhF9tQewWtGGP5sk=";
      };
    };
  });
  meta = {
    description = "Assets for use with traffic_editor.";
  };
})
