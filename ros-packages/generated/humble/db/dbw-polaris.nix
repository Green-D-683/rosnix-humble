{
  ament-cmake,
  buildAmentCmakePackage,
  dbw-polaris-can,
  dbw-polaris-description,
  dbw-polaris-joystick-demo,
  dbw-polaris-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dbw_polaris";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_polaris";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dbw-polaris-can dbw-polaris-description dbw-polaris-joystick-demo dbw-polaris-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dbw-polaris-can dbw-polaris-description dbw-polaris-joystick-demo dbw-polaris-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_polaris" = substituteSource {
      src = fetchgit {
        name = "dbw_polaris-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "c433de50d1050f2671be6531a828718bbfaebef9";
        hash = "sha256-A2fmKjGlIAKo7gV34uwz7p9Xy+3kb9slBNQi6bohSTg=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire interface to the Dataspeed Inc. Polaris GEM/Ranger/RZR DBW kit\n  ";
  };
})
