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
  pname = "soccer_vision_attribute_msgs";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."soccer_vision_attribute_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_vision_attribute_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_attribute_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "db7f8c2824d86cd51561fd76b6e2c0cf78be0c13";
        hash = "sha256-3YI3tO0R3y6nA1z66Tg0Eusoa9vpxWc2tpSRHAMoHfI=";
      };
    };
  });
  meta = {
    description = "A package containing attributes of objects in 2d/3d vision in the soccer domain.";
  };
})
