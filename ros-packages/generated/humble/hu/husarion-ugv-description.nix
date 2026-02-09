{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  husarion-components-description,
  joint-state-publisher,
  joint-state-publisher-gui,
  launch,
  launch-ros,
  mkSourceSet,
  nav2-common,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "husarion_ugv_description";
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."husarion_ugv_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ husarion-components-description joint-state-publisher joint-state-publisher-gui launch launch-ros nav2-common robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ husarion-components-description joint-state-publisher joint-state-publisher-gui launch launch-ros nav2-common robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "husarion_ugv_description" = substituteSource {
      src = fetchgit {
        name = "husarion_ugv_description-source";
        url = "https://github.com/ros2-gbp/husarion_ugv_ros-release.git";
        rev = "17bd001b54c6f43fc4a313e65c3d86ed6f6cdc40";
        hash = "sha256-Fd03yE+8/sS7+vxgAMk2IVAySmud+UtuopBRacAq0Mk=";
      };
    };
  });
  meta = {
    description = "The package contains URDF and mesh files for Husarion UGV";
  };
})
