{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_platform_multirotor_simulator";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_platform_multirotor_simulator";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-cpp as2-core as2-msgs rclcpp std-msgs std-srvs ];
  propagatedBuildInputs = [ ament-cmake ament-index-cpp as2-core as2-msgs rclcpp std-msgs std-srvs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_platform_multirotor_simulator" = substituteSource {
      src = fetchgit {
        name = "as2_platform_multirotor_simulator-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "e561caaf7db02a658e4455505edd0a38987ac587";
        hash = "sha256-Sw/7uAR7J0rkW3Jjc90oUY0bZ7OOdfDrUKSuhrxbOoI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/RPS98/multirotor_simulator.git";
          to = "URL ${sources."as2_platform_multirotor_simulator/multirotor_simulator"}";
        }
      ];
    };
    "as2_platform_multirotor_simulator/multirotor_simulator" = substituteSource {
      src = fetchgit {
        name = "multirotor_simulator-source";
        url = "https://github.com/RPS98/multirotor_simulator.git";
        rev = "98a419f07b32b30572a152aeccd2291be5e6aaa9";
        hash = "sha256-onJTUmI1EhQ0FM5yh7+7CDF4RTMbwHNK8Dr+FZagN3U=";
      };
    };
  });
  meta = {
    description = "Lightweight simulator";
  };
})
