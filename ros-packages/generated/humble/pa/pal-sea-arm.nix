{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-sea-arm-bringup,
  pal-sea-arm-controller-configuration,
  pal-sea-arm-description,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_sea_arm";
  version = "1.21.0-1";
  src = finalAttrs.passthru.sources."pal_sea_arm";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pal-sea-arm-bringup pal-sea-arm-controller-configuration pal-sea-arm-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pal-sea-arm-bringup pal-sea-arm-controller-configuration pal-sea-arm-description ];
  passthru.sources = mkSourceSet (sources: {
    "pal_sea_arm" = substituteSource {
      src = fetchgit {
        name = "pal_sea_arm-source";
        url = "https://github.com/ros2-gbp/pal_sea_arm-release.git";
        rev = "68366fadd1987793ab7f23307021e5195c19655c";
        hash = "sha256-m0SbfORbe/90sHOQYafDYUSEILV7wfsIL+QSnBRDHQc=";
      };
    };
  });
  meta = {
    description = "The pal_sea_arm package";
  };
})
