{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "mocap4r2_marker_viz_srvs";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mocap4r2_marker_viz_srvs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_marker_viz_srvs" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_marker_viz_srvs-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "b2f050039eedc9e9a35fbde6db5be8694e7e5850";
        hash = "sha256-IX8TD+uAFWLqVOYhDPyuQPYPwLSV+lRBI4FgcttAwrg=";
      };
    };
  });
  meta = {
    description = "Service definitions for the marker visualization node";
  };
})
