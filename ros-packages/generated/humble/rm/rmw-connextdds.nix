{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmw-connextdds-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_connextdds";
  version = "0.11.5-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake rmw-connextdds-common ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "b8acf6507ebffa8b5a44d2072613f4601121f02b";
        hash = "sha256-mdIRys+AUy+cqaD/7YtAAEzZ2kfPQO+zseKGVZZFXrI=";
      };
    };
  });
  meta = {
    description = "A ROS2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
