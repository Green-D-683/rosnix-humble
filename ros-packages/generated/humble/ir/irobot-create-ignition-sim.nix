{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-ignition-bringup,
  irobot-create-ignition-plugins,
  irobot-create-ignition-toolbox,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_ignition_sim";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_ignition_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ irobot-create-ignition-bringup irobot-create-ignition-plugins irobot-create-ignition-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-ignition-bringup irobot-create-ignition-plugins irobot-create-ignition-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_ignition_sim" = substituteSource {
      src = fetchgit {
        name = "irobot_create_ignition_sim-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "2c60dc17da1dac2d7941778ac31c17db1688f4c2";
        hash = "sha256-YtE9gS9ohYPn+ww+RBzpEvXn5Rf0ldxtPO69SfiE960=";
      };
    };
  });
  meta = {
    description = "Metapackage for the iRobot(R) Create(R) 3 robot Ignition simulator";
  };
})
