{
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosapi_msgs";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."rosapi_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rosapi_msgs" = substituteSource {
      src = fetchgit {
        name = "rosapi_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "cf0a35dfca9e7386d6d4b46da6153209266ac209";
        hash = "sha256-LW5yDyh6log7otnURb+pvt6yfZxfulA3ys+kliqz9P4=";
      };
    };
  });
  meta = {
    description = "Interface definitions for rosapi package.";
  };
})
