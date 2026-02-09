{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-description,
  franka-hardware,
  franka-robot-state-broadcaster,
  joint-state-broadcaster,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_bringup";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager franka-description franka-hardware franka-robot-state-broadcaster joint-state-broadcaster joint-state-publisher robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager franka-description franka-hardware franka-robot-state-broadcaster joint-state-broadcaster joint-state-publisher robot-state-publisher rviz2 xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "franka_bringup" = substituteSource {
      src = fetchgit {
        name = "franka_bringup-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "ad21150c5c3a5874b42a8742fbb37c520c688a24";
        hash = "sha256-vlFYIR5b/UqrBIH0XrlqOo3hkuuN4MwfYXxtjnpNnY8=";
      };
    };
  });
  meta = {
    description = "Package with launch files and run-time configurations for using Franka Robotics research robots with ros2_control";
  };
})
