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
  pname = "gc_spl_interfaces";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."gc_spl_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gc_spl_interfaces" = substituteSource {
      src = fetchgit {
        name = "gc_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "c4b19a63d813d91e2a34f51373328b0073da6f2e";
        hash = "sha256-tmM3rnX+KbXRJr4vBsy3CsbOJoU9QIyYymBYIcSz44c=";
      };
    };
  });
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
})
