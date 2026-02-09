{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "apriltag_mit";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."apriltag_mit";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" "eigen" "libboost-dev" "libopencv-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "eigen" "libboost-dev" "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "apriltag_mit" = substituteSource {
      src = fetchgit {
        name = "apriltag_mit-source";
        url = "https://github.com/ros2-gbp/apriltag_mit-release.git";
        rev = "b5c81a715a12a1f0fa61a4c9b4e86c3fc7ea6eb9";
        hash = "sha256-jtyFLPFDqq9Tdttiux8jWkwktY3QiG3aV/GdYZRIpVM=";
      };
    };
  });
  meta = {
    description = "ROS2 package wrapper for the MIT apriltag detector";
  };
})
