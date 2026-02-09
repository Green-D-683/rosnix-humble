{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  chomp-motion-planner,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  pluginlib,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_chomp_optimizer_adapter";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_chomp_optimizer_adapter";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ chomp-motion-planner moveit-common moveit-core pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ chomp-motion-planner moveit-common moveit-core pluginlib ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_chomp_optimizer_adapter" = substituteSource {
      src = fetchgit {
        name = "moveit_chomp_optimizer_adapter-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ac61f5f5c31dc5bd6684914b0cbf761d333dcb0d";
        hash = "sha256-ezP66l9FNqLKjRA4e2TjPStrbSJ4sknFnpeC5cTJAb0=";
      };
    };
  });
  meta = {
    description = "MoveIt planning request adapter utilizing chomp for solution optimization";
  };
})
