{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  as2-behavior,
  as2-core,
  as2-motion-reference-handlers,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  trajectory-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_behaviors_swarm_flocking";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_behaviors_swarm_flocking";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-ros as2-behavior as2-core as2-motion-reference-handlers as2-msgs geometry-msgs rclcpp rclcpp-action rclcpp-components tf2 tf2-ros trajectory-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-ros as2-behavior as2-core as2-motion-reference-handlers as2-msgs geometry-msgs rclcpp rclcpp-action rclcpp-components tf2 tf2-ros trajectory-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_behaviors_swarm_flocking" = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_swarm_flocking-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "82f72b4436a0a186b1763939e43a4c66b62d8cb3";
        hash = "sha256-YZ9KueQtID9yyRKnho8speRGkqnoosIENMXy4tGNWx8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/miferco97/dynamic_trajectory_generator.git";
          to = "URL ${sources."as2_behaviors_swarm_flocking/dynamic_trajectory_generator"}";
        }
      ];
    };
    "as2_behaviors_swarm_flocking/dynamic_trajectory_generator" = substituteSource {
      src = fetchgit {
        name = "dynamic_trajectory_generator-source";
        url = "https://github.com/miferco97/dynamic_trajectory_generator.git";
        rev = "bf6931e29dde4f4c897cdd2b0993fb66081f56ae";
        hash = "sha256-GU2sNRW6aEyFY6a3KaNi9LYCUB5pLvkHtW8xM5Z5CfI=";
      };
      substitutions = [
        {
          path = "subpackages/mav_trajectory_generation/cmake_dependencies/glog_dependencies.cmake";
          from = "URL https://github.com/google/glog/archive/4ffa98388f8a28c55b0c8acfbba5f62df954c2a4.zip";
          to = "URL ${sources."as2_behaviors_swarm_flocking/dynamic_trajectory_generator/4ffa98388f8a28c55b0c8acfbba5f62df954c2a4"}";
        }
        {
          path = "subpackages/mav_trajectory_generation/cmake_dependencies/nlopt_dependencies.cmake";
          from = "URL https://github.com/stevengj/NLopt/archive/09b3c2a6da71cabcb98d2c8facc6b83d2321ed71.zip";
          to = "URL ${sources."as2_behaviors_swarm_flocking/dynamic_trajectory_generator/09b3c2a6da71cabcb98d2c8facc6b83d2321ed71"}";
        }
      ];
    };
    "as2_behaviors_swarm_flocking/dynamic_trajectory_generator/09b3c2a6da71cabcb98d2c8facc6b83d2321ed71" = substituteSource {
      src = fetchzip {
        name = "09b3c2a6da71cabcb98d2c8facc6b83d2321ed71-source";
        url = "https://github.com/stevengj/NLopt/archive/09b3c2a6da71cabcb98d2c8facc6b83d2321ed71.zip";
        hash = "sha256-TgieCX7yUdTAEblzXY/gCN0r6F9TVDh4RdNDjQdXZ1o=";
      };
    };
    "as2_behaviors_swarm_flocking/dynamic_trajectory_generator/4ffa98388f8a28c55b0c8acfbba5f62df954c2a4" = substituteSource {
      src = fetchzip {
        name = "4ffa98388f8a28c55b0c8acfbba5f62df954c2a4-source";
        url = "https://github.com/google/glog/archive/4ffa98388f8a28c55b0c8acfbba5f62df954c2a4.zip";
        hash = "sha256-K272RyjC+5Nj9vK+h8nY4+TzY9xjpCudsweI4plJv5I=";
      };
    };
  });
  meta = {
    description = "AS2 behavior swarm flocking";
  };
})
