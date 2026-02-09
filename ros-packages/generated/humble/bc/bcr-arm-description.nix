{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf-tutorial,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bcr_arm_description";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."bcr_arm_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ urdf-tutorial ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf-tutorial ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm_description" = substituteSource {
      src = fetchgit {
        name = "bcr_arm_description-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "67d9df4e05a0df2cd93364fece4e595e843d782e";
        hash = "sha256-bb2xF2BJRlsHFhowb5r+U9SLsik/f3WREeQI+d3J2po=";
      };
    };
  });
  meta = {
    description = "robot description files including urdf, meshes and launch files for the bcr arm";
  };
})
