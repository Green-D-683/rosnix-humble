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
  nav2-core,
  nav2-msgs,
  nav2-util,
  opennav-docking-msgs,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking_bt";
  version = "0.0.2-4";
  src = finalAttrs.passthru.sources."opennav_docking_bt";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ behaviortree-cpp-v3 geometry-msgs nav2-behavior-tree nav2-core nav2-msgs nav2-util nav-msgs opennav-docking-msgs rclcpp rclcpp-action ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp-v3 geometry-msgs nav2-behavior-tree nav2-core nav2-msgs nav2-util nav-msgs opennav-docking-msgs rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking_bt" = substituteSource {
      src = fetchgit {
        name = "opennav_docking_bt-source";
        url = "https://github.com/open-navigation/opennav_docking-release.git";
        rev = "7da9878e7c29c66bb9a7d9287b1b5397d4f61607";
        hash = "sha256-UuMxqgsNYV0bgZICYMWVxNUE9GFB5sL5VU9+qfu/zww=";
      };
    };
  });
  meta = {
    description = "A set of BT nodes and XMLs for docking";
  };
})
