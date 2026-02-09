{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus_moveit_config";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."crane_plus_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit robot-state-publisher rviz2 tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit robot-state-publisher rviz2 tf2-ros xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_moveit_config" = substituteSource {
      src = fetchgit {
        name = "crane_plus_moveit_config-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "9252ce90510986c645947ee946c701fb436edc2e";
        hash = "sha256-kvvtIRpfHfvua3AGiXMeqbREyJAoA5ia88mxBAfFCuY=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 move_group config package";
  };
})
