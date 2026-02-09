{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "smacc2_msgs";
  version = "2.3.20-2";
  src = finalAttrs.passthru.sources."smacc2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "smacc2_msgs" = substituteSource {
      src = fetchgit {
        name = "smacc2_msgs-source";
        url = "https://github.com/robosoft-ai/SMACC2-release.git";
        rev = "510e42898162cbafb22e7a1ea7e748d0094ddf28";
        hash = "sha256-kDwBD0TpcOMqKC9hLF6lQkbf08FjPJYKM/zww//IbXw=";
      };
    };
  });
  meta = {
    description = "Messages and services used in smacc2.";
  };
})
