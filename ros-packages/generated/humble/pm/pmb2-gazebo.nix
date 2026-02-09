{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-plugins,
  gazebo-ros,
  gazebo-ros2-control,
  launch-pal,
  mkSourceSet,
  nav2-bringup,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  pal-maps,
  pal-urdf-utils,
  pmb2-2dnav,
  pmb2-bringup,
  pmb2-description,
  pmb2-laser-sensors,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_gazebo";
  version = "4.9.1-1";
  src = finalAttrs.passthru.sources."pmb2_gazebo";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch-pal nav2-bringup pal-gazebo-plugins pal-gazebo-worlds pal-maps pal-urdf-utils pmb2-2dnav pmb2-bringup pmb2-description pmb2-laser-sensors ros2launch ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch-pal nav2-bringup pal-gazebo-plugins pal-gazebo-worlds pal-maps pal-urdf-utils pmb2-2dnav pmb2-bringup pmb2-description pmb2-laser-sensors ros2launch ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_gazebo" = substituteSource {
      src = fetchgit {
        name = "pmb2_gazebo-source";
        url = "https://github.com/pal-gbp/pmb2_simulation-release.git";
        rev = "49e2a862ca4c72e9efba11a65e0ca0942f1fabf8";
        hash = "sha256-omsKpjwd9D0l8O/ibiNa/laPpxESPGuWsMhh7BpbWiA=";
      };
    };
  });
  meta = {
    description = "Simulation files for the PMB2 robot.";
  };
})
