{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-plugins,
  gazebo-ros,
  gazebo-ros2-control,
  launch,
  launch-pal,
  launch-ros,
  mkSourceSet,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  pal-pro-gripper-description,
  pal-sea-arm-bringup,
  pal-sea-arm-description,
  pal-sea-arm-moveit-config,
  pal-urdf-utils,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_sea_arm_gazebo";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."pal_sea_arm_gazebo";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros pal-gazebo-plugins pal-gazebo-worlds pal-pro-gripper-description pal-sea-arm-bringup pal-sea-arm-description pal-sea-arm-moveit-config pal-urdf-utils ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros pal-gazebo-plugins pal-gazebo-worlds pal-pro-gripper-description pal-sea-arm-bringup pal-sea-arm-description pal-sea-arm-moveit-config pal-urdf-utils ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_sea_arm_gazebo" = substituteSource {
      src = fetchgit {
        name = "pal_sea_arm_gazebo-source";
        url = "https://github.com/ros2-gbp/pal_sea_arm_simulation-release.git";
        rev = "6ebc7b80d17d6e7e253fbd58c1d62cf7ccaba8a9";
        hash = "sha256-2DMpY1XNB1dKFoDRRBPa/MbqPYni2R02PxpF4sjDknI=";
      };
    };
  });
  meta = {
    description = "The pal_sea_arm_gazebo package";
  };
})
