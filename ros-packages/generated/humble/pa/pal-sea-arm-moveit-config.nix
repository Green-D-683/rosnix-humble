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
  pal-sea-arm-description,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_sea_arm_moveit_config";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."pal_sea_arm_moveit_config";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-pal moveit-configs-utils moveit-kinematics moveit-planners-chomp moveit-planners-ompl moveit-ros-control-interface moveit-ros-move-group moveit-ros-perception moveit-ros-visualization pal-sea-arm-description ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ launch-pal moveit-configs-utils moveit-kinematics moveit-planners-chomp moveit-planners-ompl moveit-ros-control-interface moveit-ros-move-group moveit-ros-perception moveit-ros-visualization pal-sea-arm-description ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_sea_arm_moveit_config" = substituteSource {
      src = fetchgit {
        name = "pal_sea_arm_moveit_config-source";
        url = "https://github.com/ros2-gbp/pal_sea_arm_moveit_config-release.git";
        rev = "b2cbc44d7869b235a453e7cea691e5cac3d54e74";
        hash = "sha256-dD6KRaZUgtGatI4NrdF9hrYoZvccYjCl7xVWQKHsPJM=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the pal_sea_arm with the MoveIt Motion Planning Framework\n  ";
  };
})
