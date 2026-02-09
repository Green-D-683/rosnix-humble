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
  pname = "create_msgs";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."create_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "create_msgs" = substituteSource {
      src = fetchgit {
        name = "create_msgs-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "f7e87a6a6d181842d222db53f7dc24c912d156ba";
        hash = "sha256-73JO3cpeq8Lctv3gHY4nHPvOrtjWk4CT4ksV9nT/xfA=";
      };
    };
  });
  meta = {
    description = "Common message definitions for create_robot";
  };
})
