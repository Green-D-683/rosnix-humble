{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_waypoint_follower";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."nav2_waypoint_follower";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport nav2-common nav2-core nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport nav2-common nav2-core nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_waypoint_follower" = substituteSource {
      src = fetchgit {
        name = "nav2_waypoint_follower-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6454b7981dc8fdad0fe746b96c3a39fae4467709";
        hash = "sha256-qb04Dm87iulW3Tx5uONRF8bu50szQkgKJMgj9kXNZqE=";
      };
    };
  });
  meta = {
    description = "A waypoint follower navigation server";
  };
})
