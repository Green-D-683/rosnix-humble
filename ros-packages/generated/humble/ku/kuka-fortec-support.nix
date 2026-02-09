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
  pname = "kuka_fortec_support";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_fortec_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui kuka-gazebo kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher-gui kuka-gazebo kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_fortec_support" = substituteSource {
      src = fetchgit {
        name = "kuka_fortec_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "a1cf5b87d18e0a918739142eabe37dc40c231388";
        hash = "sha256-smEVqi8lFrOSerOPL4h3MQlSuTp4FpMB7CcukiQAvFM=";
      };
    };
  });
  meta = {
    description = "Robot models for the KUKA FORTEC family.";
  };
})
