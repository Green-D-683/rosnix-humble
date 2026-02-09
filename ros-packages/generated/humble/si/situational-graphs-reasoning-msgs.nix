{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "situational_graphs_reasoning_msgs";
  version = "0.0.0-1";
  src = finalAttrs.passthru.sources."situational_graphs_reasoning_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "situational_graphs_reasoning_msgs" = substituteSource {
      src = fetchgit {
        name = "situational_graphs_reasoning_msgs-source";
        url = "https://github.com/ros2-gbp/situational_graphs_reasoning_msgs-release.git";
        rev = "8fa368a0c5fa5488c013ef1b99be86008c1b0afa";
        hash = "sha256-Hidi+3OFpGL+wpTIWImKPXrKKtrtoj7pBMnutO0z8SM=";
      };
    };
  });
  meta = {
    description = "Custom reasoning msgs";
  };
})
