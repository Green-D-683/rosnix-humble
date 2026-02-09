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
  pname = "kuka_cybertech_support";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_cybertech_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher-gui kuka-resources launch-ros robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_cybertech_support" = substituteSource {
      src = fetchgit {
        name = "kuka_cybertech_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "92fb677a241ca2c3d5343a8299e2b9aaf568fd34";
        hash = "sha256-XTs5wSqLkYPifd91PjZPpRmYZiZrmvbpHp0hQv4f/3U=";
      };
    };
  });
  meta = {
    description = "Robot models for the KUKA cybertech family.";
  };
})
