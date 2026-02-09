{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-common,
  navigation2,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "neo_nav2_bringup";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."neo_nav2_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-common navigation2 slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common navigation2 slam-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "neo_nav2_bringup" = substituteSource {
      src = fetchgit {
        name = "neo_nav2_bringup-source";
        url = "https://github.com/ros2-gbp/neo_nav2_bringup-release.git";
        rev = "dc6a8b98acdbc29515b2166d3501a82da1d4fa00";
        hash = "sha256-PKbq+xtDUlmP6EodFYFP1I9nq125J5Im7b4Ea5foz1U=";
      };
    };
  });
  meta = {
    description = "ROS-2 navigation bringup packages for neobotix robots";
  };
})
