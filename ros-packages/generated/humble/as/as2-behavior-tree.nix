{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-msgs,
  behaviortree-cpp-v3,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-behavior-tree,
  nav2-msgs,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_behavior_tree";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_behavior_tree";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ as2-core as2-msgs behaviortree-cpp-v3 geometry-msgs nav2-behavior-tree nav2-msgs rclcpp rclcpp-action sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-core as2-msgs behaviortree-cpp-v3 geometry-msgs nav2-behavior-tree nav2-msgs rclcpp rclcpp-action sensor-msgs std-srvs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_behavior_tree" = substituteSource {
      src = fetchgit {
        name = "as2_behavior_tree-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "ac1fd5688ccafecc957e4330a38bdef312d82995";
        hash = "sha256-CfCZqHvSlA+Kmn3HmSEFprO3sDSGXiH/cDNjKOeZnfg=";
      };
    };
  });
  meta = {
    description = "AS2 behavior trees";
  };
})
