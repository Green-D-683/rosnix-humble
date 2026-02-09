{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_panda_description";
  version = "2.0.7-1";
  src = finalAttrs.passthru.sources."moveit_resources_panda_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_panda_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "ec0faa09e332c84e87268ad8f7b8b3550a764185";
        hash = "sha256-qnfDWjDLhM85id/hXNqXCwYVPtuo8pWZAgxR8RbaJuU=";
      };
    };
  });
  meta = {
    description = "panda Resources used for MoveIt testing";
  };
})
