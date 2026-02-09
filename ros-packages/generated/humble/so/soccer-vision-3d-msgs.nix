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
  pname = "soccer_vision_3d_msgs";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."soccer_vision_3d_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime soccer-vision-attribute-msgs vision-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime soccer-vision-attribute-msgs vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_vision_3d_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_3d_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "647267fd8222e8823123334fc8133f9a4dc2b7a1";
        hash = "sha256-bLQzBOaQ2AgcW/nho3XL9j4iSYR1Y5Ne05AkI0Ey8ns=";
      };
    };
  });
  meta = {
    description = "A package containing some 3D vision related message definitions in the soccer domain.";
  };
})
