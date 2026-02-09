{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dbw_ford_description";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_ford_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ robot-state-publisher urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  checkInputs = [ rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_ford_description" = substituteSource {
      src = fetchgit {
        name = "dbw_ford_description-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "7c50b03cfcdfff221cf361e84d9c846b09d3949b";
        hash = "sha256-mLEsMvljqyhqv8ppivONDHSnjmZk3l6opvl4keq8uPM=";
      };
    };
  });
  meta = {
    description = "\n    URDF and meshes describing the Lincoln MKZ.\n  ";
  };
})
