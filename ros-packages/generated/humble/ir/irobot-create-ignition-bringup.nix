{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  ign-ros2-control,
  irobot-create-common-bringup,
  irobot-create-description,
  irobot-create-ignition-plugins,
  irobot-create-ignition-toolbox,
  irobot-create-msgs,
  mkSourceSet,
  ros-ign-bridge,
  ros-ign-gazebo,
  ros-ign-interfaces,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_ignition_bringup";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_ignition_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs ign-ros2-control irobot-create-common-bringup irobot-create-description irobot-create-ignition-plugins irobot-create-ignition-toolbox irobot-create-msgs ros-ign-bridge ros-ign-gazebo ros-ign-interfaces std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs ign-ros2-control irobot-create-common-bringup irobot-create-description irobot-create-ignition-plugins irobot-create-ignition-toolbox irobot-create-msgs ros-ign-bridge ros-ign-gazebo ros-ign-interfaces std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_ignition_bringup" = substituteSource {
      src = fetchgit {
        name = "irobot_create_ignition_bringup-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "a788c6fecf32e7cb05a0b4eee5964f186f337f55";
        hash = "sha256-fiO45HzfvcyUlGMqjjkuJ3Z+tplErsRIZk+ldIiJCww=";
      };
    };
  });
  meta = {
    description = "Provides launch and configuration scripts for a Ignition simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
})
