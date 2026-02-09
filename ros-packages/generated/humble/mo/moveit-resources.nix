{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  moveit-resources-fanuc-description,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-description,
  moveit-resources-panda-moveit-config,
  moveit-resources-pr2-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources";
  version = "2.0.7-1";
  src = finalAttrs.passthru.sources."moveit_resources";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config moveit-resources-pr2-description robot-state-publisher ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config moveit-resources-pr2-description robot-state-publisher ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources" = substituteSource {
      src = fetchgit {
        name = "moveit_resources-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "216ad03b6e42931ebca2b7ae5061ffe618ca07d7";
        hash = "sha256-2JXpcJUmN9knalpl57FLgPm7nTh4CNGaVdk7ulxv5Mc=";
      };
    };
  });
  meta = {
    description = "Resources used for MoveIt testing";
  };
})
