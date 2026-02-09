{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  omni-base-description,
  pal-gripper-description,
  pal-hey5-description,
  pal-robotiq-description,
  pal-urdf-utils,
  pmb2-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf-test,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_description";
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."tiago_description";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch launch-pal launch-param-builder launch-ros omni-base-description pal-gripper-description pal-hey5-description pal-robotiq-description pal-urdf-utils pmb2-description robot-state-publisher xacro ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ launch launch-pal launch-param-builder launch-ros omni-base-description pal-gripper-description pal-hey5-description pal-robotiq-description pal-urdf-utils pmb2-description robot-state-publisher xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing-ament-cmake urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_description" = substituteSource {
      src = fetchgit {
        name = "tiago_description-source";
        url = "https://github.com/pal-gbp/tiago_robot-release.git";
        rev = "d268b0b5724e53757de817e2d6aba3045376a515";
        hash = "sha256-LI5ZNsPRu9lTQQD+BFHiYMOnkgYRAN8ut/CDH9ixr1I=";
      };
    };
  });
  meta = {
    description = "This package contains the description (mechanical, kinematic, visual,\n      etc.) of the TIAGO robot.  The files in this package are parsed and used by\n      a variety of other components.  Most users will not interact directly\n      with this package.";
  };
})
