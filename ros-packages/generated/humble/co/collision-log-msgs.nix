{
  ament-cmake,
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
  pname = "collision_log_msgs";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."collision_log_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "collision_log_msgs" = substituteSource {
      src = fetchgit {
        name = "collision_log_msgs-source";
        url = "https://github.com/ros2-gbp/metrics_msgs-release.git";
        rev = "0df00e7cad19dac73cfbcaa07a7cea3770cc0a9a";
        hash = "sha256-ouuKYvHteOpcCMce+5D73sHmFtv4hiMqMtA5H4rzkZo=";
      };
    };
  });
  meta = {
    description = "Messages for describing collisions (simulated or not)";
  };
})
