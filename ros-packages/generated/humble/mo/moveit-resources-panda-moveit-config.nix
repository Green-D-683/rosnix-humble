{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  moveit-resources-panda-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_panda_moveit_config";
  version = "2.0.7-1";
  src = finalAttrs.passthru.sources."moveit_resources_panda_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_panda_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "3bc141c0d39d612641171314588ed34dc48c8871";
        hash = "sha256-IzD8h9vG/ubI+KiIi29jdSYHAPemP2mDltKRwe/8iNU=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
