{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "radar_msgs";
  version = "0.2.1-3";
  src = finalAttrs.passthru.sources."radar_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators std-msgs unique-identifier-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "radar_msgs" = substituteSource {
      src = fetchgit {
        name = "radar_msgs-source";
        url = "https://github.com/ros2-gbp/radar_msgs-release.git";
        rev = "78a5d5a75c9741da280e7ab42f412774e567e4a4";
        hash = "sha256-09etKgWuUL3tN+uERho/rQvfxovMzjJUK+2J9fg5Sa4=";
      };
    };
  });
  meta = {
    description = "Standard ROS messages for radars";
  };
})
