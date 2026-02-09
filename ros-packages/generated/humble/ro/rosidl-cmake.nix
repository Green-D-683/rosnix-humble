{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-adapter,
  rosidl-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_cmake";
  version = "3.1.8-1";
  src = finalAttrs.passthru.sources."rosidl_cmake";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake rosidl-adapter rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake rosidl-adapter rosidl-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_cmake" = substituteSource {
      src = fetchgit {
        name = "rosidl_cmake-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "f2e4f699ffedf5bbeb1c2c65b60d2d66371fad7a";
        hash = "sha256-fJDK4bZwLPKIWOTZ5yuFOKCJwLjKE0FYczFcbH6SW7U=";
      };
    };
  });
  meta = {
    description = "The CMake functionality to invoke code generation for ROS interface files.";
  };
})
