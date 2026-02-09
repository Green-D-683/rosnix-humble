{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foros_msgs";
  version = "0.4.1-2";
  src = finalAttrs.passthru.sources."foros_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "foros_msgs" = substituteSource {
      src = fetchgit {
        name = "foros_msgs-source";
        url = "https://github.com/ros2-gbp/foros-release.git";
        rev = "a2621dabcd63ebb67347338b2a126b0694d198c1";
        hash = "sha256-2BfM+m3iK91wzWpNIBa4jXvgTI/2J8uCslc7wc8omzs=";
      };
    };
  });
  meta = {
    description = "Fail over ROS messages (raft RPCs)";
  };
})
