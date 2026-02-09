{
  ament-cmake-auto,
  autoware-cmake,
  autoware-node,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_test_node";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_test_node";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-node rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-node rclcpp rclcpp-components ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_test_node" = substituteSource {
      src = fetchgit {
        name = "autoware_test_node-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "cbddffe2738380cc9b855322e28bcc608394101f";
        hash = "sha256-ikoCZAJrCNQLsUfbJ5PFT44hqoAsusxOLBi81oxki50=";
      };
    };
  });
  meta = {
    description = "Test package for Autoware Node.";
  };
})
