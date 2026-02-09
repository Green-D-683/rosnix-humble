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
  pname = "kuka_agilus_support";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_agilus_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui kuka-gazebo kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher-gui kuka-gazebo kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_agilus_support" = substituteSource {
      src = fetchgit {
        name = "kuka_agilus_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "67896865756b6b59e670cbe4955f32b1731896d7";
        hash = "sha256-5kdlMZFUfDUb7cPbUZ526lODwXlvVrIzCwKoANfmFzI=";
      };
    };
  });
  meta = {
    description = "Robot models for the KUKA agilus family.";
  };
})
