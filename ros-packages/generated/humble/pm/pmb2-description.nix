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
  joint-state-publisher-gui,
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  pal-urdf-utils,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf-test,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_description";
  version = "5.10.2-1";
  src = finalAttrs.passthru.sources."pmb2_description";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui launch launch-pal launch-param-builder launch-ros pal-urdf-utils rviz2 xacro ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ joint-state-publisher-gui launch launch-pal launch-param-builder launch-ros pal-urdf-utils rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing-ament-cmake urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_description" = substituteSource {
      src = fetchgit {
        name = "pmb2_description-source";
        url = "https://github.com/pal-gbp/pmb2_robot-gbp.git";
        rev = "ce3dfd4021a4e15182370572a1a23e18a972f7c8";
        hash = "sha256-vTs+u/MEXEpNTCcSpZSjJ7NSNy53ifGvi+F3364XzWo=";
      };
    };
  });
  meta = {
    description = "\n      Mechanical, kinematic, visual, etc. description of the PMB2 robot.\n      The files in this package are parsed and used by\n      a variety of other components.  Most users will not interact directly\n      with this package.\n  ";
  };
})
