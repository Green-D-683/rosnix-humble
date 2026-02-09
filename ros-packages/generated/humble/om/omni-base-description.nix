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
  gazebo-planar-move-plugin,
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
  pname = "omni_base_description";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."omni_base_description";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-planar-move-plugin joint-state-publisher-gui launch launch-pal launch-param-builder launch-ros pal-urdf-utils rviz2 xacro ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ gazebo-planar-move-plugin joint-state-publisher-gui launch launch-pal launch-param-builder launch-ros pal-urdf-utils rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing-ament-cmake urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_description" = substituteSource {
      src = fetchgit {
        name = "omni_base_description-source";
        url = "https://github.com/pal-gbp/omni_base_robot-release.git";
        rev = "2c925d36708c27037ea921993368b3c3d706d288";
        hash = "sha256-vJ4o1wminzPrHOuH+dTGXMK/PAskRx02obaUXU46z1M=";
      };
    };
  });
  meta = {
    description = "This package contains the description (mechanical, kinematic, visual,\n      etc.) of the omni_base robot.  The files in this package are parsed and used by\n      a variety of other components.  Most users will not interact directly\n      with this package.";
  };
})
