{
  ament-cmake,
  buildAmentCmakePackage,
  ewellix-description,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-description,
  kortex-description,
  mkSourceSet,
  robot-state-publisher,
  robotiq-description,
  rosSystemPackages,
  substituteSource,
  ur-description,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_manipulators_description";
  version = "1.3.9-1";
  src = finalAttrs.passthru.sources."clearpath_manipulators_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-description franka-description kortex-description robot-state-publisher robotiq-description ur-description urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-description franka-description kortex-description robot-state-publisher robotiq-description ur-description urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_manipulators_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_manipulators_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "9143e6537f74b60d67b73d7468baaba60dc5f0e9";
        hash = "sha256-xupprTEqIK1DGp86n1wZHmLNiZypIHAzhwTQ02YNReQ=";
      };
    };
  });
  meta = {
    description = "Clearpath manipulator URDF descriptions";
  };
})
