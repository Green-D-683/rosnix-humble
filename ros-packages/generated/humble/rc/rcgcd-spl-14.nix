{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcgcd_spl_14";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."rcgcd_spl_14";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcgcd_spl_14" = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "bb1a46a9d270e2e5f0d75c0aedfc27d8ba141917";
        hash = "sha256-GW/Afw3vBLINmJMdFDrM2jSM6x/f6Xi67ZYXNfT2nBI=";
      };
    };
  });
  meta = {
    description = "RoboCup SPL GameController Data V14 ROS msg";
  };
})
