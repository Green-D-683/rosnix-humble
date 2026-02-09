{
  ament-cmake,
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
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_behaviors_motion";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_behaviors_motion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ as2-behavior as2-core as2-motion-reference-handlers as2-msgs pluginlib rclcpp rclcpp-action rclcpp-components std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-behavior as2-core as2-motion-reference-handlers as2-msgs pluginlib rclcpp rclcpp-action rclcpp-components std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_behaviors_motion" = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_motion-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "e886c42e39a98f0acd6e4f7394d641bf945a55d8";
        hash = "sha256-B+Jqbr4KaFIWA6SkLNCyOEYlVeDW+1rLRDiUdPJrMmU=";
      };
    };
  });
  meta = {
    description = "AS2 Movement Behaviors Behaviors Meta Package";
  };
})
