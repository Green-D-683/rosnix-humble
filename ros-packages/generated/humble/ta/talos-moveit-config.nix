{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-pal,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners-ompl,
  moveit-ros-move-group,
  moveit-ros-perception,
  moveit-ros-visualization,
  moveit-simple-controller-manager,
  rosSystemPackages,
  substituteSource,
  talos-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "talos_moveit_config";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."talos_moveit_config";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-pal moveit-configs-utils moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-perception moveit-ros-visualization moveit-simple-controller-manager talos-description ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ launch-pal moveit-configs-utils moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-perception moveit-ros-visualization moveit-simple-controller-manager talos-description ];
  passthru.sources = mkSourceSet (sources: {
    "talos_moveit_config" = substituteSource {
      src = fetchgit {
        name = "talos_moveit_config-source";
        url = "https://github.com/pal-gbp/talos_moveit_config-release.git";
        rev = "c5b7465984f2c28d066b0c32ff354124375bdd9c";
        hash = "sha256-3ibUPFhlgK8vMGumpb6JfRIDT2CXoZn7WgkymLCliCM=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the talos with the MoveIt! Motion Planning Framework\n  ";
  };
})
