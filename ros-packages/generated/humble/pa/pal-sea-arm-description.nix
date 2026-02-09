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
  pal-pro-gripper-description,
  pal-sea-arm-controller-configuration,
  pal-urdf-utils,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf-test,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_sea_arm_description";
  version = "1.21.0-1";
  src = finalAttrs.passthru.sources."pal_sea_arm_description";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui launch launch-pal launch-param-builder launch-ros pal-pro-gripper-description pal-sea-arm-controller-configuration pal-urdf-utils robot-state-publisher xacro ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ joint-state-publisher-gui launch launch-pal launch-param-builder launch-ros pal-pro-gripper-description pal-sea-arm-controller-configuration pal-urdf-utils robot-state-publisher xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing-ament-cmake urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "pal_sea_arm_description" = substituteSource {
      src = fetchgit {
        name = "pal_sea_arm_description-source";
        url = "https://github.com/ros2-gbp/pal_sea_arm-release.git";
        rev = "b53ff5a159b7bd78abca1a298d9e22c9023877ca";
        hash = "sha256-LOqdEartOhZ0z+rlotA1vBZ/fL/RGdzrpYJyVLVNO0M=";
      };
    };
  });
  meta = {
    description = "The pal_sea_arm_description package";
  };
})
