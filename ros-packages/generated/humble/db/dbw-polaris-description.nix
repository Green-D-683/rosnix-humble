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
  pname = "dbw_polaris_description";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_polaris_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ robot-state-publisher urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  checkInputs = [ rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_polaris_description" = substituteSource {
      src = fetchgit {
        name = "dbw_polaris_description-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "d8d6c2ff0ed69cde5ab453dfec281c4edc81fe82";
        hash = "sha256-VfyxotLp8wkq483KUyCIr1r+4KiFAhB0nCTtOceZwFo=";
      };
    };
  });
  meta = {
    description = "\n    URDF and meshes describing Polaris vehicles.\n  ";
  };
})
