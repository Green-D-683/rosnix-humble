{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dolly-follow,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-ign-bridge,
  ros-ign-gazebo,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dolly_ignition";
  version = "0.4.0-3";
  src = finalAttrs.passthru.sources."dolly_ignition";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dolly-follow ros2launch ros-ign-bridge ros-ign-gazebo rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dolly-follow ros2launch ros-ign-bridge ros-ign-gazebo rviz2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dolly_ignition" = substituteSource {
      src = fetchgit {
        name = "dolly_ignition-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "a1879098defd0ef21e2c823a4ea32884571037c1";
        hash = "sha256-BGdsjbemIWS94BjSHjDClK1ui6sM17J0lJlrhfhj/Vg=";
      };
    };
  });
  meta = {
    description = "\n    Launch Ignition simulation with Dolly robot.\n  ";
  };
})
