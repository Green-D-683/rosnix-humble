{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ign_ros2_control";
  version = "0.7.18-1";
  src = finalAttrs.passthru.sources."ign_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gz-ros2-control ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-ros2-control ];
  passthru.sources = mkSourceSet (sources: {
    "ign_ros2_control" = substituteSource {
      src = fetchgit {
        name = "ign_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "85ddf5801a56b352370476219b0e77d65601384a";
        hash = "sha256-7l5cDnME5SBTvRELOghYgdz0/Zp933S63/vJPiVrHDw=";
      };
    };
  });
  meta = {
    description = "Ignition ros2_control package allows to control simulated robots using ros2_control framework.";
  };
})
