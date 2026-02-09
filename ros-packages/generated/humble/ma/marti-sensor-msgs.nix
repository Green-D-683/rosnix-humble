{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_sensor_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_sensor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "marti_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "164d927f0e62389822225db4b091d37a20190ff8";
        hash = "sha256-waPgK4Yx5LSjfVSvjvq9aI0o3wfx0K+KxSkCs103PhM=";
      };
    };
  });
  meta = {
    description = "\n\n     marti_sensor_msgs\n\n  ";
  };
})
