{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_object_map_msgs";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_object_map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_object_map_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_object_map_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "7b0217899fe4d0dfa7dca8c7b71db24812d0f547";
        hash = "sha256-PcR3OKQhJEMbhq/vd5b1hiY8s8SyBnpAWzjt47cmGbw=";
      };
    };
  });
  meta = {
    description = "The tuw_object_map_msgs package";
  };
})
