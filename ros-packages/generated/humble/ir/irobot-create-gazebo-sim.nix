{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-gazebo-bringup,
  irobot-create-gazebo-plugins,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_gazebo_sim";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_gazebo_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ irobot-create-gazebo-bringup irobot-create-gazebo-plugins ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-gazebo-bringup irobot-create-gazebo-plugins ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_gazebo_sim" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gazebo_sim-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "bc45aad6a7d767cd72d2ee6a1ff0de4b0a3da4df";
        hash = "sha256-nCTh/fk+mSyfDnzh/DTdbZXuDuVXEJrrVm8wfrRepic=";
      };
    };
  });
  meta = {
    description = "Metapackage for the iRobot(R) Create(R) 3 robot Gazebo simulator";
  };
})
