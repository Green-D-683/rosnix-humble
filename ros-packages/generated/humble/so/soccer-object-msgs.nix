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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_object_msgs";
  version = "1.0.1-4";
  src = finalAttrs.passthru.sources."soccer_object_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_object_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_object_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_object_msgs-release.git";
        rev = "662d3ec38925a4ffd53e39d7f4d278f6f611ef2d";
        hash = "sha256-L9tzxNygLV6DbioNwnYhQLIEZ49+s1/LRBiPsBXopTw=";
      };
    };
  });
  meta = {
    description = "Package providing interfaces for objects in a soccer domain.";
  };
})
