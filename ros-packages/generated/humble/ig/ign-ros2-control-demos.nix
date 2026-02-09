{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control-demos,
  launch,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ign_ros2_control_demos";
  version = "0.7.18-1";
  src = finalAttrs.passthru.sources."ign_ros2_control_demos";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp gz-ros2-control-demos launch launch-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp gz-ros2-control-demos launch launch-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ign_ros2_control_demos" = substituteSource {
      src = fetchgit {
        name = "ign_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "4ce3bdcb941c6613f33dae0f0b10a323c9b96a99";
        hash = "sha256-J0C4YdxX9qByjm/TYh2XWTG++r/04p27HVZVGncu/zg=";
      };
    };
  });
  meta = {
    description = "Shim package for gz_ros2_control_demos";
  };
})
