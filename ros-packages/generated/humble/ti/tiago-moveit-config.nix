{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-pal,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners-ompl,
  moveit-ros-control-interface,
  moveit-ros-move-group,
  moveit-ros-perception,
  moveit-ros-visualization,
  rosSystemPackages,
  substituteSource,
  tiago-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_moveit_config";
  version = "3.1.2-1";
  src = finalAttrs.passthru.sources."tiago_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-pal moveit-configs-utils moveit-kinematics moveit-planners-ompl moveit-ros-control-interface moveit-ros-move-group moveit-ros-perception moveit-ros-visualization tiago-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-pal moveit-configs-utils moveit-kinematics moveit-planners-ompl moveit-ros-control-interface moveit-ros-move-group moveit-ros-perception moveit-ros-visualization tiago-description ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_moveit_config" = substituteSource {
      src = fetchgit {
        name = "tiago_moveit_config-source";
        url = "https://github.com/pal-gbp/tiago_moveit_config-release.git";
        rev = "3cb410b655a5e236bdce3e0e8b941e74e9336d5d";
        hash = "sha256-L9YDM8xcFDXk6ZgylZqEpnamckU54fmSL/rfhTv45Ww=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the tiago with the MoveIt Motion Planning Framework\n  ";
  };
})
