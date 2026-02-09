{
  ament-cmake,
  buildAmentCmakePackage,
  dbw-ford-can,
  dbw-ford-description,
  dbw-ford-joystick-demo,
  dbw-ford-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dbw_ford";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_ford";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dbw-ford-can dbw-ford-description dbw-ford-joystick-demo dbw-ford-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dbw-ford-can dbw-ford-description dbw-ford-joystick-demo dbw-ford-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_ford" = substituteSource {
      src = fetchgit {
        name = "dbw_ford-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "1ad92d87a279432af2189aa5327d513f3ffa8b6d";
        hash = "sha256-mkgwKEHOHfyxe//8VLGI6Od7Meattp9eEi+E0JCFO0A=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire interface to the Dataspeed Inc. Lincoln MKZ DBW kit\n  ";
  };
})
