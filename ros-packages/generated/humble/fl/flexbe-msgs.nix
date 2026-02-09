{
  action-msgs,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flexbe_msgs";
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."flexbe_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flexbe_msgs" = substituteSource {
      src = fetchgit {
        name = "flexbe_msgs-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "efd657918e781ccea59c225438c299c90643c08e";
        hash = "sha256-EW3SST59gkRYJl6aW5UPXEAKdeZR3WI1VY6PDtCUntU=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_msgs provides the messages used by FlexBE.\n    ";
  };
})
