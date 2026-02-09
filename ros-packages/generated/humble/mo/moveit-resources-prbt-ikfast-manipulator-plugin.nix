{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  tf2-eigen-kdl,
  tf2-geometry-msgs,
  tf2-kdl,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_prbt_ikfast_manipulator_plugin";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_ikfast_manipulator_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-core pluginlib rclcpp tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-core pluginlib rclcpp tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_ikfast_manipulator_plugin" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_ikfast_manipulator_plugin-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "fc02883e8561ddf1a8f376ae1f7522e7f4d07a0e";
        hash = "sha256-9JE5tgDiihvo4wvwsvGhtb3V9y/9XYfj8X9iE0SC9Hg=";
      };
    };
  });
  meta = {
    description = "The prbt_ikfast_manipulator_plugin package";
  };
})
