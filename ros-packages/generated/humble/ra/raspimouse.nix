{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  raspimouse-msgs,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."raspimouse";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs lifecycle-msgs nav-msgs raspimouse-msgs rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs nav-msgs raspimouse-msgs rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs tf2 tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse" = substituteSource {
      src = fetchgit {
        name = "raspimouse-source";
        url = "https://github.com/ros2-gbp/raspimouse2-release.git";
        rev = "e7f815007fd18bae7aa8066b4e30b31aa27fa431";
        hash = "sha256-9K6T6sA1HWGNM8FyRTucX/wGCCSFiR2f5V/ziMlTwvk=";
      };
    };
  });
  meta = {
    description = "RaspiMouse ROS 2 node";
  };
})
