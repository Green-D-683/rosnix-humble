{
  ament-cmake-auto,
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
  pname = "autoware_adapi_version_msgs";
  version = "1.9.1-2";
  src = finalAttrs.passthru.sources."autoware_adapi_version_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_version_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_version_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "890c303871d857d37a821bdc03d498d73185e6bd";
        hash = "sha256-TlmyypekwmlsqbY9BDoATEjj0S2MJKiG0F5bkmR6q1U=";
      };
    };
  });
  meta = {
    description = "The Autoware AD API version interfaces";
  };
})
