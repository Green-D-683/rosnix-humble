{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp-v3,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-behavior-tree,
  nav2-common,
  nav2-core,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_bt_navigator";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."nav2_bt_navigator";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ behaviortree-cpp-v3 geometry-msgs nav2-behavior-tree nav2-common nav2-core nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action rclcpp-lifecycle std-msgs std-srvs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp-v3 geometry-msgs nav2-behavior-tree nav2-common nav2-core nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action rclcpp-lifecycle std-msgs std-srvs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_bt_navigator" = substituteSource {
      src = fetchgit {
        name = "nav2_bt_navigator-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "f9593743be835bedc0278cd83423ab964d508191";
        hash = "sha256-rqn6Pr+/oyQ6ggKsPALbdvNPWgpLfIIPiPOIvAbnaoU=";
      };
    };
  });
  meta = {
    description = "TODO";
  };
})
