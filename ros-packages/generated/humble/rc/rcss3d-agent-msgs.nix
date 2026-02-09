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
  pname = "rcss3d_agent_msgs";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."rcss3d_agent_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rcss3d_agent_msgs" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_msgs-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "d3069acfd24be5adc40d0389b37288f74d6e369b";
        hash = "sha256-U5/xBh3zM6pnCwpRRYlhiUhE3c2LKGYhLqZfRlRHJMA=";
      };
    };
  });
  meta = {
    description = "Custom messages for communicating with rcss3d_agent";
  };
})
