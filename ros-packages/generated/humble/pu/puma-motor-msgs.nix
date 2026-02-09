{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "puma_motor_msgs";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."puma_motor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "puma_motor_msgs" = substituteSource {
      src = fetchgit {
        name = "puma_motor_msgs-source";
        url = "https://github.com/clearpath-gbp/puma_motor_driver-release.git";
        rev = "81149b119b5c336f38006a812d647a790664a20a";
        hash = "sha256-BJ3dk/7r2UBxaKIQiG7tuPKlKU4O5deFMkxnUR7m2/I=";
      };
    };
  });
  meta = {
    description = "Messages specific to Puma.";
  };
})
