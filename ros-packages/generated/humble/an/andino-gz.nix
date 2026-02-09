{
  ament-cmake,
  andino-description,
  andino-slam,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  nav2-common,
  ros-gz-bridge,
  ros-gz-sim,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_gz";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."andino_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ andino-description andino-slam nav2-bringup nav2-common ros2launch ros-gz-bridge ros-gz-sim rviz2 xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-gazebo6" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ andino-description andino-slam nav2-bringup nav2-common ros2launch ros-gz-bridge ros-gz-sim rviz2 xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-gazebo6" ]; };
  passthru.sources = mkSourceSet (sources: {
    "andino_gz" = substituteSource {
      src = fetchgit {
        name = "andino_gz-source";
        url = "https://github.com/ros2-gbp/andino_gz-release.git";
        rev = "fb12249a67ff96a0cdc27f7d821de57701b168d8";
        hash = "sha256-yUWMMdjMr4sOCEQipd+zQyCyD3qrHy/yOd/snPfPdco=";
      };
    };
  });
  meta = {
    description = "\n    Launch Gazebo simulation with andino robot.\n  ";
  };
})
