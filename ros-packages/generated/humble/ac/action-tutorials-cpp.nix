{
  action-tutorials-interfaces,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "action_tutorials_cpp";
  version = "0.20.8-1";
  src = finalAttrs.passthru.sources."action_tutorials_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-tutorials-interfaces rclcpp rclcpp-action rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-tutorials-interfaces rclcpp rclcpp-action rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_cpp" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "994d85bc35a0c363a058eea13106603b3e18a407";
        hash = "sha256-g3x1Kv/ffMXrym2sYwTTR+Kuay/iGys1YKaWaUKcvww=";
      };
    };
  });
  meta = {
    description = "C++ action tutorial cpp code";
  };
})
