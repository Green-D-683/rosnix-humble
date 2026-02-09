{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  create3-republisher,
  depthai-bridge,
  depthai-examples,
  depthai-ros-driver,
  depthai-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-linux,
  mkSourceSet,
  nav2-common,
  rosSystemPackages,
  rplidar-ros,
  substituteSource,
  teleop-twist-joy,
  tf2-ros,
  turtlebot4-description,
  turtlebot4-diagnostics,
  turtlebot4-node,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_bringup";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ create3-republisher depthai-bridge depthai-examples depthai-ros-driver depthai-ros-msgs joy-linux nav2-common rplidar-ros teleop-twist-joy tf2-ros turtlebot4-description turtlebot4-diagnostics turtlebot4-node ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ create3-republisher depthai-bridge depthai-examples depthai-ros-driver depthai-ros-msgs joy-linux nav2-common rplidar-ros teleop-twist-joy tf2-ros turtlebot4-description turtlebot4-diagnostics turtlebot4-node ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_bringup" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "04a802835be8966efd9213f49d9dfe445abb043f";
        hash = "sha256-a2tAJO35Negd9/Gg3op7DyVT1goIlRMG3J+ACKdi4bI=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Robot Bringup";
  };
})
