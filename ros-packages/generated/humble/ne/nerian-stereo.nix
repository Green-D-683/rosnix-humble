{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nerian_stereo";
  version = "1.2.1-2";
  src = finalAttrs.passthru.sources."nerian_stereo";
  propagatedNativeBuildInputs = [ ament-cmake cv-bridge rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ];
  propagatedBuildInputs = [ ament-cmake cv-bridge rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nerian_stereo" = substituteSource {
      src = fetchgit {
        name = "nerian_stereo-source";
        url = "https://github.com/nerian-vision/nerian_stereo_ros2-release.git";
        rev = "c4bc6df97c388d2e0be18fe7da10f9ce7b5ba47d";
        hash = "sha256-7JABk+LZokHngEhswL2NRdfxGiF7Ll1BlBIxM8B7Zb8=";
      };
    };
  });
  meta = {
    description = "Driver node for ROS 2 for Scarlet, SceneScan and SP1 stereo vision sensors by Nerian Vision GmbH";
  };
})
