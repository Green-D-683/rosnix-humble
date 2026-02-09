{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  joint-trajectory-controller,
  joy,
  joy-teleop,
  launch-pal,
  mkSourceSet,
  pal-sea-arm-controller-configuration,
  pal-sea-arm-description,
  play-motion2,
  play-motion2-cli,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_sea_arm_bringup";
  version = "1.21.0-1";
  src = finalAttrs.passthru.sources."pal_sea_arm_bringup";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-broadcaster joint-trajectory-controller joy joy-teleop launch-pal pal-sea-arm-controller-configuration pal-sea-arm-description play-motion2 play-motion2-cli ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ joint-state-broadcaster joint-trajectory-controller joy joy-teleop launch-pal pal-sea-arm-controller-configuration pal-sea-arm-description play-motion2 play-motion2-cli ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_sea_arm_bringup" = substituteSource {
      src = fetchgit {
        name = "pal_sea_arm_bringup-source";
        url = "https://github.com/ros2-gbp/pal_sea_arm-release.git";
        rev = "5d3f1db76b13c45645828569f0b2952c38796807";
        hash = "sha256-i7fkis2Dxs208Di+dbnyacKR0cI+eF5efLXqn+iPLiU=";
      };
    };
  });
  meta = {
    description = "Launch files to upload the robot description and start the controllers";
  };
})
