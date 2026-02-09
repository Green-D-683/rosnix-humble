{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher-gui,
  kuka-gazebo,
  kuka-resources,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_lbr_iisy_support";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_lbr_iisy_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui kuka-gazebo kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher-gui kuka-gazebo kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_lbr_iisy_support" = substituteSource {
      src = fetchgit {
        name = "kuka_lbr_iisy_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "a07780582b2a19f9175166fa3771b9dabf626247";
        hash = "sha256-Jp40AcnG8uHQswV3+tPlaGW9OjI9vlKsypnE8J0YUG8=";
      };
    };
  });
  meta = {
    description = "Package containing models of KUKA LBR iisy family";
  };
})
