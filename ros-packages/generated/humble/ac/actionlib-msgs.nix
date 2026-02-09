{
  ament-cmake,
  ament-lint-common,
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
  pname = "actionlib_msgs";
  version = "4.9.0-1";
  src = finalAttrs.passthru.sources."actionlib_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "actionlib_msgs" = substituteSource {
      src = fetchgit {
        name = "actionlib_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "57d040f6ef3cfc56158581d6d2185c04a92ee414";
        hash = "sha256-V6utqn2sovAZz0GDYlKHZLcHBI1p5au/lb8uRHjNJh0=";
      };
    };
  });
  meta = {
    description = "A package containing some message definitions used in the implementation of ROS 1 actions.";
  };
})
