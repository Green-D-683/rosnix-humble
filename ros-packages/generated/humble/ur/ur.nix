{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  ur-calibration,
  ur-controllers,
  ur-dashboard-msgs,
  ur-moveit-config,
  ur-robot-driver,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."ur";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ur-calibration ur-controllers ur-dashboard-msgs ur-moveit-config ur-robot-driver ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ur-calibration ur-controllers ur-dashboard-msgs ur-moveit-config ur-robot-driver ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ur" = substituteSource {
      src = fetchgit {
        name = "ur-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "e0e596a02db16205915ea23f9bc685d553533a4e";
        hash = "sha256-tWjXD8RLf/mpsw50cus4tWKqX8scj51AQSXisp6gANg=";
      };
    };
  });
  meta = {
    description = "Metapackage for universal robots";
  };
})
