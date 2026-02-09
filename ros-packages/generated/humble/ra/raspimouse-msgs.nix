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
  pname = "raspimouse_msgs";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."raspimouse_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_msgs" = substituteSource {
      src = fetchgit {
        name = "raspimouse_msgs-source";
        url = "https://github.com/ros2-gbp/raspimouse2-release.git";
        rev = "4f6c5aec3e24871395f59615d0394067ed76fccb";
        hash = "sha256-2eZkV3e9FJfSFdaYJDNTjhBd1AdoY7oPVNxG4PW8c2w=";
      };
    };
  });
  meta = {
    description = "RaspiMouse messages";
  };
})
