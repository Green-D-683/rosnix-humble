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
  pname = "moveit_resources_pr2_description";
  version = "2.0.7-1";
  src = finalAttrs.passthru.sources."moveit_resources_pr2_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_pr2_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_pr2_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "e034f0a246a5d44d4e95aa482dd6a818a02764bb";
        hash = "sha256-4eERk3ggPltXlbCVP319B+6aK7D4ZRRvKKKUwT5GtbA=";
      };
    };
  });
  meta = {
    description = "PR2 Resources used for MoveIt! testing";
  };
})
