{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-motion-reference-handlers,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_motion_controller";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_motion_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ as2-core as2-motion-reference-handlers as2-msgs geometry-msgs pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" "eigen" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-core as2-motion-reference-handlers as2-msgs geometry-msgs pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "eigen" "yaml-cpp" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_motion_controller" = substituteSource {
      src = fetchgit {
        name = "as2_motion_controller-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "c5049f5501ed6c12098d43a8f52c29254deac504";
        hash = "sha256-EhusnZTy3CAdGsGMB0vnWJFgTwo8MmluogUQckydNbw=";
      };
      substitutions = [
        {
          path = "plugins/pid_speed_controller/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/RPS98/pid_controller.git";
          to = "URL ${sources."as2_motion_controller/pid_controller"}";
        }
      ];
    };
    "as2_motion_controller/pid_controller" = substituteSource {
      src = fetchgit {
        name = "pid_controller-source";
        url = "https://github.com/RPS98/pid_controller.git";
        rev = "bc4743307db3f18affa232c04f068896cc69b528";
        hash = "sha256-zWXbp5FD99qio8KgIsI+hturfJEeZ5s50mWK+jbi7FE=";
      };
    };
  });
  meta = {
    description = "AS2 Controller Package";
  };
})
