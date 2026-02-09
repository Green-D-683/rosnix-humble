{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-param-builder,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-fanuc-description,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-description,
  moveit-resources-panda-moveit-config,
  moveit-ros-planning,
  orocos-kdl-vendor,
  pluginlib,
  ros-testing,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-kdl,
  urdfdom,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_kinematics";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_kinematics";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ class-loader moveit-common moveit-core moveit-msgs orocos-kdl-vendor pluginlib tf2 tf2-kdl urdfdom ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3-lxml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ class-loader moveit-common moveit-core moveit-msgs orocos-kdl-vendor pluginlib tf2 tf2-kdl urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-lxml" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-param-builder moveit-configs-utils moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config moveit-ros-planning ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_kinematics" = substituteSource {
      src = fetchgit {
        name = "moveit_kinematics-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1cfd9fcffe35e13daa1b1971077df7cb22ee4d34";
        hash = "sha256-TAUeWC1KJFSbhaVufgNPms8w7E0fMiyaqMRMIcStURo=";
      };
    };
  });
  meta = {
    description = "Package for all inverse kinematics solvers in MoveIt";
  };
})
