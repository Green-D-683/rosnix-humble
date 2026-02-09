{
  ament-cmake-auto,
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
  moveit-planners-chomp,
  moveit-planners-ompl,
  moveit-ros-control-interface,
  moveit-ros-move-group,
  moveit-ros-perception,
  moveit-ros-visualization,
  pal-sea-arm-moveit-config,
  rosSystemPackages,
  substituteSource,
  tiago-pro-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_moveit_config";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."tiago_pro_moveit_config";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-pal moveit-configs-utils moveit-kinematics moveit-planners-chomp moveit-planners-ompl moveit-ros-control-interface moveit-ros-move-group moveit-ros-perception moveit-ros-visualization pal-sea-arm-moveit-config tiago-pro-description ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ launch-pal moveit-configs-utils moveit-kinematics moveit-planners-chomp moveit-planners-ompl moveit-ros-control-interface moveit-ros-move-group moveit-ros-perception moveit-ros-visualization pal-sea-arm-moveit-config tiago-pro-description ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_moveit_config" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_moveit_config-source";
        url = "https://github.com/ros2-gbp/tiago_pro_moveit_config-release.git";
        rev = "8e5a41be6eb1ef76a69c59e22561d0a7877a41b8";
        hash = "sha256-kAtHiwv3qTwCfgpbMa+t3zdhg9toohNWnyZ6mdgDWcs=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the tiago_pro with the MoveIt! Motion Planning Framework\n  ";
  };
})
