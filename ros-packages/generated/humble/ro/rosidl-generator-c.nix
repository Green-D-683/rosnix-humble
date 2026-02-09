{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-parser,
  rosidl-runtime-c,
  rosidl-typesupport-interface,
  substituteSource,
  test-interface-files,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_c";
  version = "3.1.8-1";
  src = finalAttrs.passthru.sources."rosidl_generator_c";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcutils rosidl-cli rosidl-cmake rosidl-parser rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcutils rosidl-cli rosidl-cmake rosidl-parser rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-cmake rosidl-runtime-c test-interface-files ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "59f0a59e31fc32aebaac66f23db6a1e62e90bc3e";
        hash = "sha256-zdVN2N0kPvoBGgFyYDo6Z7BdXihj2Mb3l88/RCHXMEk=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C.";
  };
})
