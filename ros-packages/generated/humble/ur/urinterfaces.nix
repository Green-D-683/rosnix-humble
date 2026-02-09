{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urinterfaces";
  version = "7.0.0-1";
  src = finalAttrs.passthru.sources."urinterfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urinterfaces" = substituteSource {
      src = fetchgit {
        name = "urinterfaces-source";
        url = "https://github.com/ros2-gbp/urinterfaces-release.git";
        rev = "d5ed6a2f9273b18059bdc22e8ae1ed526565aece";
        hash = "sha256-8z25zl+ZH8oldRJcRAIWL4riDUeWp9CjhbaDfbtyvMM=";
      };
    };
  });
  meta = {
    description = "A package containing ROS2 ur message definitions.";
  };
})
