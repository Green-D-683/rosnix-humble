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
  soccer-vision-attribute-msgs,
  substituteSource,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_vision_2d_msgs";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."soccer_vision_2d_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime soccer-vision-attribute-msgs vision-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime soccer-vision-attribute-msgs vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_vision_2d_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_2d_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "46ac27901b28facb80125cd6a802f9b9d9fddb65";
        hash = "sha256-duA77VpnEb0fl+60A5is7mEX0MNTAQubzlog9GTEHig=";
      };
    };
  });
  meta = {
    description = "A package containing some 2D vision related message definitions in the soccer domain.";
  };
})
