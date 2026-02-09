{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-common,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-eigen,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_marker_tools";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."rviz_marker_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometry-msgs moveit-common rclcpp std-msgs tf2-eigen visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "liburdfdom-headers-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module geometry-msgs moveit-common rclcpp std-msgs tf2-eigen visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liburdfdom-headers-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_marker_tools" = substituteSource {
      src = fetchgit {
        name = "rviz_marker_tools-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "c424a914e2a94a65979b8d37a5fbc23b92010fb7";
        hash = "sha256-GocxI40ApXLDIDe3leFv27ITkpy/nxGguxSm1q0UM3s=";
      };
    };
  });
  meta = {
    description = "Tools for marker creation / handling";
  };
})
