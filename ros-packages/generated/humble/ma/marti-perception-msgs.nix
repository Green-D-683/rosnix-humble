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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_perception_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_perception_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marti_perception_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_perception_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "fee9462eb77e5dde6da7aa642094833160420b0c";
        hash = "sha256-FZTo6sslxugGts/jf3daCxSI2sgmW4NAeYssvIrh1P8=";
      };
    };
  });
  meta = {
    description = "\n\n     marti_perception_msgs\n\n  ";
  };
})
