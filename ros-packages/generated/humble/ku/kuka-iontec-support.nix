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
  pname = "kuka_iontec_support";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_iontec_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui kuka-gazebo kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher-gui kuka-gazebo kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_iontec_support" = substituteSource {
      src = fetchgit {
        name = "kuka_iontec_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "2adf37dfee908fbed6efb5339a3caf251e18a59e";
        hash = "sha256-Krxrcmuq3KKf+/MdRHTLz01A8vQcfAVdVLRl0GAx7aU=";
      };
    };
  });
  meta = {
    description = "Robot models for the KUKA Iontec family.";
  };
})
