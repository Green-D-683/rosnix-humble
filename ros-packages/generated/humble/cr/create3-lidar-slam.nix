{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  rplidar-ros,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create3_lidar_slam";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."create3_lidar_slam";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ irobot-create-msgs launch-ros rplidar-ros slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-msgs launch-ros rplidar-ros slam-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "create3_lidar_slam" = substituteSource {
      src = fetchgit {
        name = "create3_lidar_slam-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "8830d101bfc0dd0f9942b5f5f0ecece91b619057";
        hash = "sha256-a3EOMxOd7W5Pl7LpaL1X0X7UF8NLh4z4T4PpdpguQQE=";
      };
    };
  });
  meta = {
    description = "Example for using an RPLIDAR A1 with a Create 3";
  };
})
