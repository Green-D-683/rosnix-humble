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
  pname = "tuw_geo_msgs";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_geo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geo_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_geo_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "02d68ac14246b670fe90cb3422e7139d2ebe552c";
        hash = "sha256-0UH7mTKROUCVCVsUf+ER9Hgr119reuwR9Oz32GPg5y4=";
      };
    };
  });
  meta = {
    description = "The tuw_geo_msgs package";
  };
})
