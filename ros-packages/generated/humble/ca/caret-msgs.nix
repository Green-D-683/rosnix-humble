{
  ament-cmake,
  ament-lint-auto,
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
  pname = "caret_msgs";
  version = "0.5.0-6";
  src = finalAttrs.passthru.sources."caret_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "caret_msgs" = substituteSource {
      src = fetchgit {
        name = "caret_msgs-source";
        url = "https://github.com/ros2-gbp/caret_trace-release.git";
        rev = "2877644443d74ce54b6e1ec92e47184d477167fa";
        hash = "sha256-KsmK/it47kXgjxRbS7DustdcPl0kc1GGpWP3aVZrvW4=";
      };
    };
  });
  meta = {
    description = "Message definitions for CARET";
  };
})
