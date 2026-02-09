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
  pname = "dbw_fca_description";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_fca_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ robot-state-publisher urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  checkInputs = [ rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_fca_description" = substituteSource {
      src = fetchgit {
        name = "dbw_fca_description-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "3c101b7ab37ab777c0783ee2ee0ddbb5de563b28";
        hash = "sha256-dFTJvh64qFzvmfOGv0+bUoIIgHxtSm4viYXdkETUHA4=";
      };
    };
  });
  meta = {
    description = "\n    URDF and meshes describing the Chrysler Pacifica.\n  ";
  };
})
