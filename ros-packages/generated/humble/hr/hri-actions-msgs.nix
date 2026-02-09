{
  action-msgs,
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
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri_actions_msgs";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."hri_actions_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "hri_actions_msgs" = substituteSource {
      src = fetchgit {
        name = "hri_actions_msgs-source";
        url = "https://github.com/ros4hri/hri_actions_msgs-release.git";
        rev = "73590248fde68fdf756d8d6a0a5deee5724d9c15";
        hash = "sha256-oMhR1hvx62tc8o8R198xbuFu97Xua5r+7rF/Jp/UwEU=";
      };
    };
  });
  meta = {
    description = "Action definitions useful for Human-Robot Interaction";
  };
})
