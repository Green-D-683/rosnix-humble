{
  ament-cmake,
  buildAmentCmakePackage,
  dbw-fca-can,
  dbw-fca-description,
  dbw-fca-joystick-demo,
  dbw-fca-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dbw_fca";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_fca";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dbw-fca-can dbw-fca-description dbw-fca-joystick-demo dbw-fca-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dbw-fca-can dbw-fca-description dbw-fca-joystick-demo dbw-fca-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_fca" = substituteSource {
      src = fetchgit {
        name = "dbw_fca-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "113a513aca449c0cffd94f8ca30f64eda87be574";
        hash = "sha256-hXALq6WGfb5YfH6GF8y7dpa2DMb1P/LwcGeXRfVnUWg=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire interface to the Dataspeed Inc. Chrysler Pacifica DBW kit\n  ";
  };
})
