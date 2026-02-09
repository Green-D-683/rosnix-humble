{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dynamixel-sdk,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rt_manipulators_cpp";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rt_manipulators_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dynamixel-sdk eigen3-cmake-module yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-sdk eigen3-cmake-module yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "yaml-cpp" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rt_manipulators_cpp" = substituteSource {
      src = fetchgit {
        name = "rt_manipulators_cpp-source";
        url = "https://github.com/ros2-gbp/rt_manipulators_cpp-release.git";
        rev = "8a05fbc9ba0244df63cc8a87c0cd08537b4927d1";
        hash = "sha256-YUJkRUHMLukwe5vyCr9kFhmmkkBb/ezgelg3SKIop3w=";
      };
    };
  });
  meta = {
    description = "RT Manipulators C++ Library";
  };
})
