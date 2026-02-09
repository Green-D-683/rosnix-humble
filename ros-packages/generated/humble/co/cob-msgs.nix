{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
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
  pname = "cob_msgs";
  version = "2.7.10-1";
  src = finalAttrs.passthru.sources."cob_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cob_msgs" = substituteSource {
      src = fetchgit {
        name = "cob_msgs-source";
        url = "https://github.com/4am-robotics/cob_common-release.git";
        rev = "c2f9c2cc91346e8c9b615b1851458b96f9d9bb2a";
        hash = "sha256-Ms6ZiL0XGS7bRMQlXtAUdEsAo6hl8WqhxNW11DCBYck=";
      };
    };
  });
  meta = {
    description = "\n    Messages for representing state information, such as battery information and emergency stop status.\n  ";
  };
})
