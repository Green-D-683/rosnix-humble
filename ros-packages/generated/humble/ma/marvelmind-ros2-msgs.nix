{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marvelmind_ros2_msgs";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."marvelmind_ros2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "marvelmind_ros2_msgs" = substituteSource {
      src = fetchgit {
        name = "marvelmind_ros2_msgs-source";
        url = "https://github.com/MarvelmindRobotics/marvelmind_ros2_msgs_release.git";
        rev = "e2cf711f412e715d454cc7f4c7d26966f4408d8b";
        hash = "sha256-Ge2JCHAh80HBI0fCpNFjg9fJhcotvDi2auvD+pPFzig=";
      };
    };
  });
  meta = {
    description = "Marvelmind message package for ROS2";
  };
})
