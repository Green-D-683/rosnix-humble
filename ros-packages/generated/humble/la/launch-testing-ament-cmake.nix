{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "launch_testing_ament_cmake";
  version = "1.0.14-1";
  src = finalAttrs.passthru.sources."launch_testing_ament_cmake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-test launch-testing python-cmake-module ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-test launch-testing python-cmake-module ];
  checkInputs = [ ament-cmake-copyright launch-testing python-cmake-module ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_ament_cmake" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ament_cmake-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "6fef769f304f19333dca6dd94c215a62c9e22e70";
        hash = "sha256-zmJGKjIjVkP0D1zKMvXnW0dSSKpyv6iMjlvhtViX6/k=";
      };
    };
  });
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
})
