{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher-gui,
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
  pname = "kuka_lbr_iiwa_support";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_lbr_iiwa_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher-gui kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_lbr_iiwa_support" = substituteSource {
      src = fetchgit {
        name = "kuka_lbr_iiwa_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "08e8577334c04bea613da924248a9b031a95c16c";
        hash = "sha256-t5VI1/UJ35bAAtDq2V4jVwxRLepRciu5HSV8XCpdr9M=";
      };
    };
  });
  meta = {
    description = "ROS2 support package for the KUKA LBR iiwa";
  };
})
