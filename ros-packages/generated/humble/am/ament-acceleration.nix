{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_acceleration";
  version = "0.2.0-2";
  src = finalAttrs.passthru.sources."ament_acceleration";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_acceleration" = substituteSource {
      src = fetchgit {
        name = "ament_acceleration-source";
        url = "https://github.com/ros2-gbp/ament_acceleration-release.git";
        rev = "ee33cfa0a853b339566de5f88e6ba9431db983f1";
        hash = "sha256-tnkilfsTlrhC8xcFlu9E8VIt8hGsNKCcdD53KV8JRac=";
      };
    };
  });
  meta = {
    description = "\n    CMake macros and utilities to include hardware acceleration into the ROS 2 build system (ament) and its development flows.\n  ";
  };
})
