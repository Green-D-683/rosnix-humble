{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-gtest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-generator-c,
  rosidl-parser,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  substituteSource,
  test-interface-files,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_cpp";
  version = "3.1.8-1";
  src = finalAttrs.passthru.sources."rosidl_generator_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-cmake rosidl-runtime-c rosidl-runtime-cpp test-interface-files ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "839056f6a2ba9731daeb6c18feb751ec2a7a2844";
        hash = "sha256-ug3nSAdpGYUgBP1GH1mt808nwIzbrHBaWUgq/GUH3zg=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C++.";
  };
})
