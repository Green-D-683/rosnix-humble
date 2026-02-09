{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-description,
  franka-ign-ros2-control,
  joint-state-publisher-gui,
  mkSourceSet,
  ros-gz,
  ros2controlcli,
  rosSystemPackages,
  sdformat-urdf,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_gazebo_bringup";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_gazebo_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ franka-description franka-ign-ros2-control joint-state-publisher-gui ros2controlcli ros-gz sdformat-urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ franka-description franka-ign-ros2-control joint-state-publisher-gui ros2controlcli ros-gz sdformat-urdf ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "franka_gazebo_bringup" = substituteSource {
      src = fetchgit {
        name = "franka_gazebo_bringup-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "10d9cac5b4ebb4f0422195f2d43b4d17c7e92fd6";
        hash = "sha256-DzyHd7lW/v6pzhXNFlyT3XwgMjKONOXmSUyEYDjQK70=";
      };
    };
  });
  meta = {
    description = "Contains launch files for the franka_gazebo project";
  };
})
