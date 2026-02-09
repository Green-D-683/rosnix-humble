{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "leo_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."leo_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_msgs" = substituteSource {
      src = fetchgit {
        name = "leo_msgs-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "c043ec7efeb811b70fdd1e2a1657dc67240c3a97";
        hash = "sha256-+UJDbCyZAD6rkXhUXLnEpIQ9Sr5d0l4IpW7ea5WS10o=";
      };
    };
  });
  meta = {
    description = "\n    Message and Service definitions for Leo Rover\n  ";
  };
})
