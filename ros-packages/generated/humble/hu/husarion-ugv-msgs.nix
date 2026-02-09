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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "husarion_ugv_msgs";
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."husarion_ugv_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "husarion_ugv_msgs" = substituteSource {
      src = fetchgit {
        name = "husarion_ugv_msgs-source";
        url = "https://github.com/ros2-gbp/husarion_ugv_ros-release.git";
        rev = "7a4d042d42ba94d3d69086fe46d76acdc37c4175";
        hash = "sha256-vM/DLGrA36zI2K2Ekj5FT7dJ4hA/kdhNBmlU2FOcFMU=";
      };
    };
  });
  meta = {
    description = "Custom messages for Husarion UGV";
  };
})
