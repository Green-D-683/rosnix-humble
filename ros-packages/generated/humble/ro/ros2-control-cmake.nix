{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_control_cmake";
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."ros2_control_cmake";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_cmake" = substituteSource {
      src = fetchgit {
        name = "ros2_control_cmake-source";
        url = "https://github.com/ros2-gbp/ros2_control_cmake-release.git";
        rev = "173d5a9383030c47f20dc77587d70ee5e4b3462c";
        hash = "sha256-L1uXNc9iR2HsK3PXulEzPLtgmTvdzKTO90uxRNIwC1g=";
      };
    };
  });
  meta = {
    description = "Provides CMake macros used by the ros2_control framework";
  };
})
